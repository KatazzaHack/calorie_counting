import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWeekPicker extends StatefulWidget {
  final Function onWeekChanged;

  const DateWeekPicker({Key key, this.onWeekChanged}) : super(key: key);

  @override
  DateWeekPickerState createState() => DateWeekPickerState();
}

class DateWeekPickerState extends State<DateWeekPicker> {
  DateTime _weekStart = new DateTime.now().
  subtract(Duration(days: new DateTime.now().weekday));
  static const one_week = const Duration(days: 7);
  var formatter = new DateFormat('dd/MM');

  void _decrementWeek() {
    setState(() {
      _weekStart = _weekStart.subtract(one_week);
      widget.onWeekChanged(_weekStart);
    });
  }

  void _incrementWeek() {
    setState(() {
      _weekStart = _weekStart.add(one_week);
      widget.onWeekChanged(_weekStart);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: _decrementWeek,
            child: Icon(Icons.chevron_left),
          ),
        ),
        Text(
          formatter.format(_weekStart) + " - " + formatter.format(
              _weekStart.add(new Duration(days: 6))),
          style: Theme.of(context).textTheme.headline5,
        ),
        Expanded(
          child: FlatButton(
            onPressed: _incrementWeek,
            child: Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }
}
