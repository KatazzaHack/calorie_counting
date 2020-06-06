import 'dart:core';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'out_of_pie_chart.dart';
import 'database/util.dart';
import 'dart:collection';

class WeeklyStatisticsGraph extends StatelessWidget {
  final log = Logger('StatisticsGraph');
  final DateTime firstDate;
  HashMap stats;


  WeeklyStatisticsGraph({Key key, this.firstDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NutritionState>>(
        future: getStateForDaySpan(firstDate, 7),
        builder: (context, AsyncSnapshot<List<NutritionState>> snapshot) {
          if (snapshot.hasData) {
            return  Container(
                  child: Text("qwe"),
                );
          } else {
            return CircularProgressIndicator();
          }
        }
    );
  }

//  Future<String> fetchStatistics() async {
//    stats = new HashMap<int, int> = getStateForDaySpan(firstDate, 7);
//    return Future.value("A");
//  }

  Widget buildSmallWidget(
      double width, double height, double filledBar, double fullBar,
      String name) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          width: width,
          height: height,
          child: OutOfPieChart(
            filledBar: filledBar,
            fullBar: fullBar,
            infoInside: false,
            size: height,
            stringInside: name,
          ),
        ),
        Text(
          getRounded(filledBar),
          style: TextStyle(
              height: 1.0,
              fontSize: height / 4,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildCaloriesWidget(double height, double filledBar, double fullBar) {
    return Container(
      padding: EdgeInsets.all(0),
      height: height,
      child: OutOfPieChart(
        filledBar: filledBar,
        fullBar: fullBar,
        infoInside: true,
        size: height,
        stringInside: "",
      ),
    );
  }

  Future<Widget> getDashboard(BuildContext context) async {
    NutritionState nutritionState;
    NutritionState nutritionNorms;
    nutritionState = getStateForDay(this.dateTime);
    nutritionNorms = await getNormsForDay(this.dateTime);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Future.value(Column(
        children: <Widget> [
          buildCaloriesWidget(
              0.28 * height,
              nutritionState.calories,
              nutritionNorms.calories),
          Row(children: <Widget>[
            buildSmallWidget(
              width / 4,
              0.12 * height,
              nutritionState.proteins,
              nutritionNorms.proteins,
              "P",),
            buildSmallWidget(
              width / 4,
              0.12 * height,
              nutritionState.fats,
              nutritionNorms.fats,
              "F",),
            buildSmallWidget(
              width / 4,
              0.12 * height,
              nutritionState.carbonates,
              nutritionNorms.carbonates,
              "C",),
            buildSmallWidget(
              width / 4,
              0.12 * height,
              nutritionState.water,
              nutritionNorms.water,
              "W",),
          ])
        ]
    ));
  }
}


