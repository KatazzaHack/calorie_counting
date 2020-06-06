import 'dart:core';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'out_of_pie_chart.dart';

class Dashboard extends StatelessWidget {
  final log = Logger('Dashboard');
  final DateTime dateTime;
  final Function onDashboardTap;

  Dashboard({Key key, this.dateTime, this.onDashboardTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    log.fine("build in DashWrapper " + dateTime.day.toString());
    return GestureDetector(
      onTap: onDashboardTap,
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(
        ignoring: true,
        child: Container(
          child: this.getDashboard(context),
        ),
      ),
    );
  }

  NutritionState getStateForDay(DateTime dateTime) {
    log.fine("getState for " + dateTime.day.toString());
    if (dateTime.day == DateTime.now().day) {
      return NutritionState(10, 20, 30, 100, 1000);
    } else {
      return NutritionState(10, 20, 30, 100, 1300);
    }
  }

  NutritionState getNormsForDay(DateTime dateTime) {
    return NutritionState(20, 20, 50, 1000, 1500);
  }

  Widget buildSmallWidget(
      double width, double height, int filledBar, int fullBar, String name) {
    int fontSize = (0.125 * height).round();
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

  Widget buildCaloriesWidget(double height, int filledBar, int fullBar) {
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

  Widget getDashboard(BuildContext context) {
    NutritionState nutritionState;
    NutritionState nutritionNorms;
    nutritionState = getStateForDay(this.dateTime);
    nutritionNorms = getNormsForDay(this.dateTime);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
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
    );
  }
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
