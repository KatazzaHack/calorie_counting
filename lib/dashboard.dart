import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:math';

class Dashboard extends StatefulWidget {
  final int filledBar;
  final int fullBar;
  Dashboard({Key key, this.filledBar, this.fullBar}) : super(key: key);

  @override
  DashboardState createState() => DashboardState(this.filledBar, this.fullBar);
}
class DashboardState extends State<Dashboard>{
  final int filledBar;
  final int fullBar;

  DashboardState(this.filledBar, this.fullBar);

  @override build(BuildContext context) {
    return new Container(
      height: 200,
      child: OutOfPieChart(
          filledBar: this.filledBar,
          fullBar: this.fullBar,
      ),
    );
  }
}

class OutOfPieChart extends StatefulWidget {
  final int filledBar;
  final int fullBar;

  OutOfPieChart({Key key, this.filledBar, this.fullBar}) : super(key: key);

  @override
  OutOfPieChartState createState() => OutOfPieChartState(filledBar, fullBar);
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