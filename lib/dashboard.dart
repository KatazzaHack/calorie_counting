import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:math';

class OutOfPieChart extends StatefulWidget {
@override
OutOfPieChartState createState() => OutOfPieChartState(1400, 1500);
}

class OutOfPieChartState extends State<OutOfPieChart> {
  final int fullBar;
  final int filledBar;
  OutOfPieChartState(this.filledBar, this.fullBar);

  List<charts.Series> computeSeriesList() {
    final data = [
      new Calories(
          0,
          min(this.filledBar, this.fullBar),
          charts.MaterialPalette.blue.shadeDefault),
      new Calories(
          1,
          this.fullBar - min(this.filledBar, this.fullBar),
          charts.MaterialPalette.white),
    ];
    return [
      new charts.Series<Calories, int>(
        id: 'Calories',
        domainFn: (Calories calories, _) => calories.fieldNumber,
        measureFn: (Calories calories, _) => calories.calories,
        colorFn: (Calories calories, _) => calories.color,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
        this.computeSeriesList(),
        animate: true,
        animationDuration: Duration(milliseconds: 500),
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 20));
  }
}

class Calories {
  final int fieldNumber;
  final int calories;
  charts.Color color;

  Calories(this.fieldNumber, this.calories, this.color);
}