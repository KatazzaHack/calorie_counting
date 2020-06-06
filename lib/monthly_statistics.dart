import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'pickers/date_month_picker.dart';

class MonthlyStatistics extends StatelessWidget {
  var log = Logger("MonthlyStatistics");

  void _onMonthChanged(int month) {
    log.fine("_onMonthChanged, now month = " + month.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        DateMonthPicker(
          onMonthChanged: _onMonthChanged,
        ),
        Center(
          child: Text("Monthly Statistics",
              style: const TextStyle(fontSize: 36)),
        ),
      ],
    );
  }
}