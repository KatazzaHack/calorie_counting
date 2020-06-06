import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateMonthPicker extends StatefulWidget {
  final Function onMonthChanged;

  const DateMonthPicker({Key key, this.onMonthChanged}) : super(key: key);

  @override DateMonthPickerState createState() => DateMonthPickerState();
}

class DateMonthPickerState extends State<DateMonthPicker> {
  static DateTime _timeNow = DateTime.now();
  DateTime _monthStart = DateTime.now().subtract(Duration(days: _timeNow.day - 1));
  var formatter = new DateFormat('MMMM');

  void _decrementMonth() {
    setState(() {
      // Getting previous month first.
      _monthStart = _monthStart.subtract(Duration(days: 1));
      _monthStart = _monthStart.subtract(Duration(days: _monthStart.day - 1));
      widget.onMonthChanged(_monthStart);
    });
  }

  void _incrementMonth() {
    setState(() {
      // Getting next month first.
      _monthStart = _monthStart.add(Duration(days: 31));
      _monthStart = _monthStart.subtract(Duration(days: _monthStart.day - 1));
      widget.onMonthChanged(_monthStart);
    });
  }

  @override Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: _decrementMonth,
            child: Icon(Icons.chevron_left),
          ),
        ),
        Text(
          // 0 for year as it doesn't matter, bacause we want to show month.
          formatter.format(_monthStart),
          style: Theme.of(context).textTheme.headline5,
        ),
        Expanded(
          child: FlatButton(
            onPressed: _incrementMonth,
            child: Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }
}