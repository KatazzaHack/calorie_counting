import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'date_picker.dart';
import 'dashboard.dart';
import 'main.dart';


class HomePage extends StatefulWidget {
  final Function onStatisticsPageRequest;

  const HomePage({Key key, this.onStatisticsPageRequest}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final log = Logger("HomePageState");
  DateTime _dateTime = DateTime.now();

  void _onDateChanged(DateTime dateTime) {
    setState(() {
      _dateTime = dateTime;
    });
    log.fine("_onDateChanged, now it is " + dateTime.day.toString());
  }

  void _onDashboardTapped() {
    widget.onStatisticsPageRequest(PageType.statistics);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      children: <Widget>[
        DatePicker(
          onDateChanged: _onDateChanged,
        ),
        Dashboard(
          dateTime: _dateTime,
          onDashboardTap: _onDashboardTapped,
        ),
      ],
    );
  }
}
