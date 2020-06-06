import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final Function onDateChanged;

  const DatePicker({Key key, this.onDateChanged}) : super(key: key);

  @override
  DatePickerState createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  DateTime _dateTime = new DateTime.now();
  static const one_day = const Duration(days: 1);
  var formatter = new DateFormat('dd/MM/yyyy');

  void _decrementDate() {
    setState(() {
      _dateTime = _dateTime.subtract(one_day);
      widget.onDateChanged(_dateTime);
    });
  }

  void _incrementDate() {
    setState(() {
      _dateTime = _dateTime.add(one_day);
      widget.onDateChanged(_dateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: _decrementDate,
            child: Icon(Icons.chevron_left),
          ),
        ),
        Text(
          formatter.format(_dateTime),
          style: Theme.of(context).textTheme.headline5,
        ),
        Expanded(
          child: FlatButton(
            onPressed: _incrementDate,
            child: Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }
}
