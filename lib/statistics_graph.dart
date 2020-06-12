import 'dart:core';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'out_of_pie_chart.dart';
import 'database/util.dart';
import 'dart:collection';
import 'package:charts_flutter/flutter.dart' as charts;
import 'gen/calorie_counting.pb.dart';

class StatisticsGraph extends StatelessWidget {
  final log = Logger('StatisticsGraph');
  final DateTime firstDate;
  final int days;

  StatisticsGraph({Key key, this.firstDate, this.days})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NutritionState>>(
        future: getStateForDaySpan(firstDate, 7),
        builder: (context, AsyncSnapshot<List<NutritionState>> snapshot) {
          if (snapshot.hasData) {
            return  Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: getChart(snapshot.data),
            );
          } else {
            return CircularProgressIndicator();
          }
        }
    );
  }

  Widget getChart(List<NutritionState> data) {

    List<CaloriesPerDay> dataSeries = new List<CaloriesPerDay>();
    for (int i = 0; i < data.length; ++i) {
      dataSeries.add(CaloriesPerDay(
      i.toString(),
      data[i].calories.round(),
      charts.MaterialPalette.blue.shadeDefault));
    }
    var series = [new charts.Series<CaloriesPerDay, String>(
          id: 'Calories',
          domainFn: (CaloriesPerDay calories, _) => calories.date,
          measureFn: (CaloriesPerDay calories, _) => calories.calories,
          colorFn: (CaloriesPerDay calories, _) => calories.color,
          data: dataSeries,
        ),
    ];
    return new charts.BarChart(
      series,
      animate: true,
    );
  }
}

class CaloriesPerDay {
  final String date;
  final int calories;
  charts.Color color;

  CaloriesPerDay(this.date, this.calories, this.color);
}
