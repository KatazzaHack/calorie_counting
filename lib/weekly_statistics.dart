import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'pickers/date_week_picker.dart';

class WeeklyStatistics extends StatelessWidget {
  var log = Logger("WeeklyStatistics");

  void _onWeekChanged(DateTime weekStart) {
    log.fine("_onWeekChanged, now month = " + weekStart.day.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        DateWeekPicker(
          onWeekChanged: _onWeekChanged,
        ),
        Center(
          child: Text("Weekly Statistics",
              style: const TextStyle(fontSize: 36)),
        ),
      ],
    );
  }
}