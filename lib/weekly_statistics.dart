import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'pickers/date_week_picker.dart';
import 'statistics_graph.dart';

class WeeklyStatistics extends StatelessWidget {
  var log = Logger("WeeklyStatistics");
  DateTime weekStart;

  void _onWeekChanged(DateTime weekStart) {
    log.fine("_onWeekChanged, now month = " + weekStart.day.toString());
    this.weekStart = weekStart;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        DateWeekPicker(
          onWeekChanged: _onWeekChanged,
        ),
        new StatisticsGraph(firstDate: weekStart, days: 7),
    ],
    );
  }
}