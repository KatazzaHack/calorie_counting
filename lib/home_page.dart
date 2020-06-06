import 'package:flutter/material.dart';
import 'date_picker.dart';
import 'dashboard.dart';
import 'package:logging/logging.dart';
import 'main.dart';

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
          color: Colors.redAccent,
          child: Dashboard(
            dateTime: dateTime,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final Function onStatisticsPageRequest;

  const HomePage({Key key, this.onStatisticsPageRequest}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final log = Logger("HomePageState");
  DateTime _dateTime;

  void _onDateChanged(DateTime dateTime) {
    _dateTime = dateTime;
    log.fine("_onDateChanged, now it is " + dateTime.day.toString());
  }

  void _onDashboardWrapperTapped() {
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
        DashboardWrapper(
          dateTime: _dateTime,
          onDashboardWrapperTap: _onDashboardWrapperTapped,
        ),
      ],
    );
  }
}
