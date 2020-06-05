import 'dart:core';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'out_of_pie_chart.dart';

class DashboardWrapper extends StatelessWidget {
  final log = Logger('DashboardWrapper');
  final DateTime dateTime;
  final Function onDashboardWrapperTap;

  DashboardWrapper({Key key, this.dateTime, this.onDashboardWrapperTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDashboardWrapperTap,
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(
        ignoring: true,
        child: Container(
          child: Dashboard(
            dateTime: dateTime,
          ),
        ),
      ),
    );
  }
}

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
  if (dateTime == null) {
    dateTime = DateTime.now();
  }
  if (dateTime.day == DateTime.now().day) {
    return NutritionState(10, 20, 30, 100, 1000);
  } else {
    return NutritionState(10, 20, 30, 100, 1300);
  }
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
    int fontSize = (0.125 * height).round();
    return Column (
      children: <Widget> [
        Container(
          // color: Colors.orange,
          padding: EdgeInsets.all(0),
          width: width,
          height:height,
          child: OutOfPieChart(
            filledBar: filledBar,
            fullBar: fullBar,
            infoInside: false,
            size: height,
            stringInside: name,
          ),
        ),
        Text(
          filledBar.toString(),
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

  Widget buildHugeWidget(double height, int filledBar, int fullBar) {
    return Container(
      padding: EdgeInsets.all(0),
      height:height,
      child: OutOfPieChart(
        filledBar: filledBar,
        fullBar: fullBar,
        infoInside: true,
        size: height,
        stringInside: "",
      ),
    );
  }

  @override build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
        children: <Widget> [
          buildHugeWidget(
              0.28 * height,
              this.nutritionState.calories,
              this.nutritionNorms.calories),
          Row(children: <Widget>[
            buildSmallWidget(
              width / 4,
              0.12 * height,
              this.nutritionState.proteins,
              this.nutritionNorms.proteins,
              "P",),
            buildSmallWidget(
              width / 4,
              0.12 * height,
              this.nutritionState.fats,
              this.nutritionNorms.fats,
              "F",),
            buildSmallWidget(
              width / 4,
              0.12 * height,
              this.nutritionState.carbonates,
              this.nutritionNorms.carbonates,
              "C",),
            buildSmallWidget(
              width / 4,
              0.12 * height,
              this.nutritionState.water,
              this.nutritionNorms.water,
              "W",),
          ])
        ]
    );
  }
}
