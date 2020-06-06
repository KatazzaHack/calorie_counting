import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateMonthPicker extends StatefulWidget {
  final Function onMonthChanged;

  const DateMonthPicker({Key key, this.onMonthChanged}) : super(key: key);

  @override DateMonthPickerState createState() => DateMonthPickerState();
}

class DateMonthPickerState extends State<DateMonthPicker> {
  int _month = new DateTime.now().month;
  var formatter = new DateFormat('MMMM');

  void _decrementMonth() {
    setState(() {
      _month = ((_month + 12) - 1) % 12;
      widget.onMonthChanged(_month);
    });
  }

  void _incrementMonth() {
    setState(() {
      _month = (_month + 1) % 12;
      widget.onMonthChanged(_month);
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
          formatter.format(new DateTime(0, _month)),
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