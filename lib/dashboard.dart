import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:math';

class Dashboard extends StatefulWidget {
  final DateTime dateTime;
  Dashboard({Key key, this.dateTime}) : super(key: key);

  @override
  DashboardState createState() => DashboardState(
      getStateForDay(this.dateTime),
      getNormsForDay(this.dateTime)
  );
}

class NutritionState {
  final int proteins;
  final int fats;
  final int carbonates;
  final int water;
  final int calories;

  NutritionState(
      this.proteins,
      this.fats,
      this.carbonates,
      this.water,
      this.calories);
}

NutritionState getStateForDay(DateTime dateTime) {
  return NutritionState(10, 20, 30, 100, 1000);
}

NutritionState getNormsForDay(DateTime dateTime) {
  return NutritionState(20, 20, 50, 1000, 1500);
}

class DashboardState extends State<Dashboard>{
  final NutritionState nutritionState;
  final NutritionState nutritionNorms;

  DashboardState(this.nutritionState, this.nutritionNorms);

  Widget buildSmallWidget(double width, double height,
      int filledBar, int fullBar, String name) {
    return Container(
      width: width,
      height:height,
      child: OutOfPieChart(
        filledBar: filledBar,
        fullBar: fullBar,
        infoInside: false,
        stringInside: name,
      ),
    );
  }

  Widget buildHugeWidget(double height, int filledBar, int fullBar) {
    return Container(
      height:height,
      child: OutOfPieChart(
        filledBar: filledBar,
        fullBar: fullBar,
        infoInside: true,
        stringInside: "",
      ),
    );
  }

  @override build(BuildContext context) {

    return Column(
            children: <Widget> [
              buildHugeWidget(
                  200,
                  this.nutritionState.calories,
                  this.nutritionNorms.calories),
              Row(children: <Widget>[
                buildSmallWidget(
                  MediaQuery.of(context).size.width / 4,
                  100,
                  this.nutritionState.proteins,
                  this.nutritionNorms.proteins,
                  "P",),
                buildSmallWidget(
                  MediaQuery.of(context).size.width / 4,
                  100,
                  this.nutritionState.fats,
                  this.nutritionNorms.fats,
                  "F",),
                buildSmallWidget(
                  MediaQuery.of(context).size.width / 4,
                  100,
                  this.nutritionState.carbonates,
                  this.nutritionNorms.carbonates,
                  "C",),
                buildSmallWidget(
                  MediaQuery.of(context).size.width / 4,
                  100,
                  this.nutritionState.water,
                  this.nutritionNorms.water,
                  "W",),
              ])
        ]
    );
  }
}

class OutOfPieChart extends StatefulWidget {
  final int fullBar;
  final int filledBar;
  final bool infoInside ;
  final String stringInside;

  OutOfPieChart({
    Key key, this.filledBar, this.fullBar, this.infoInside, this.stringInside})
      : super(key: key);

  @override
  OutOfPieChartState createState() => OutOfPieChartState(
      this.filledBar, this.fullBar, this.infoInside, this.stringInside);

}

class OutOfPieChartState extends State<OutOfPieChart> {
  final int fullBar;
  final int filledBar;
  final bool infoInside ;
  final String stringInside;

  OutOfPieChartState(
      this.filledBar, this.fullBar, this.infoInside, this.stringInside);

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