import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:math';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}
class DashboardState extends State<Dashboard>{
  @override build(BuildContext context) {
    return Container(
        // width: 100,
        height: 200,
        child: OutOfPieChart());
  }
}

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
      new BarHolder(
          0,
          min(this.filledBar, this.fullBar),
          charts.MaterialPalette.blue.shadeDefault),
      new BarHolder(
          1,
          this.fullBar - min(this.filledBar, this.fullBar),
          charts.MaterialPalette.white),
    ];
    return [
      new charts.Series<BarHolder, int>(
        id: 'Calories',
        domainFn: (BarHolder calories, _) => calories.fieldNumber,
        measureFn: (BarHolder calories, _) => calories.calories,
        colorFn: (BarHolder calories, _) => calories.color,
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

class BarHolder {
  final int fieldNumber;
  final int calories;
  charts.Color color;

  BarHolder(this.fieldNumber, this.calories, this.color);
}