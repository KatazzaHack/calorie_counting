import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:math';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}
class DashboardState extends State<Dashboard>{
  @override build(BuildContext context) {
    return Column(
            children: <Widget> [
              Container(height:200, child:OutOfPieChart()),
              Row(children: <Widget>[
                Container(width:MediaQuery.of(context).size.width / 4,height:100, child:OutOfPieChart()),
                Container(width:MediaQuery.of(context).size.width / 4,height:100, child:OutOfPieChart()),
                Container(width:MediaQuery.of(context).size.width / 4,height:100, child:OutOfPieChart()),
                Container(width:MediaQuery.of(context).size.width / 4,height:100, child:OutOfPieChart()),
              ])
        ]
    );
  }
}

class OutOfPieChart extends StatefulWidget {
@override
OutOfPieChartState createState() => OutOfPieChartState();
}

class OutOfPieChartState extends State<OutOfPieChart> {
  final int fullBar = 0;
  final int filledBar = 0;
  final int size = 100;
  final bool infoInside = true;
  final String stringInside = "F";

  OutOfPieChartState();

  List<charts.Series> computeSeriesList() {
    int blueArc = min(this.filledBar, this.fullBar);
    int whiteArc = this.fullBar - min(this.filledBar, this.fullBar);
    if ((whiteArc == 0) && (blueArc == 0)) {
      whiteArc = 0;
      blueArc = 1;
    }
    final data = [
      new BarHolder(
          0,
          blueArc,
          charts.MaterialPalette.blue.shadeDefault),
      new BarHolder(
          1,
          whiteArc,
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
    return Stack(
      children: <Widget>[
        charts.PieChart(
            this.computeSeriesList(),
            animate: true,
            animationDuration: Duration(milliseconds: 500),
            defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: infoInside ? 10 : 8)),
        Center(
          child: Text(
            infoInside? "$filledBar / $fullBar" : stringInside,
            style: TextStyle(
                fontSize: infoInside ? 20.0 : 15.0,
                color: infoInside
                    ? charts.ColorUtil.toDartColor(
                    charts.MaterialPalette.blue.shadeDefault)
                    : Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}

class BarHolder {
  final int fieldNumber;
  final int calories;
  charts.Color color;

  BarHolder(this.fieldNumber, this.calories, this.color);
}