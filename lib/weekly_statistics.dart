import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'pickers/date_week_picker.dart';
import 'statistics_graph.dart';

class WeeklyStatistics extends StatefulWidget {
  @override
  WeeklyStatisticsState createState() => WeeklyStatisticsState();
}

class WeeklyStatisticsState extends State<WeeklyStatistics> {
  DateTime weekStart = DateTime.now();
  var log = Logger("WeeklyStatistics");

  void _onWeekChanged(DateTime _weekStart) {
    log.fine("_onWeekChanged, now week = " + weekStart.day.toString());
    setState(() {
      log.fine("setState = " + weekStart.day.toString());
      this.weekStart = _weekStart;
    });
  }

  @override
  Widget build(BuildContext context) {
    log.fine("build for week = " + weekStart.day.toString());
    return Column(
      children: <Widget> [
        DateWeekPicker(
          onWeekChanged: _onWeekChanged,
        ),
        StatisticsGraph(firstDate: weekStart, days: 7),
    ],
    );
  }
}