import 'package:flutter/material.dart';
import 'date_month_picker.dart';
import 'package:logging/logging.dart';

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
          child: Text("Monthly Statistics", style: const TextStyle(fontSize: 36)),
        ),
      ],
    );
  }
}

class WeeklyStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Weekly Statistics", style: const TextStyle(fontSize: 36)),
    );
  }
}

class StatisticsPage extends StatefulWidget {
  @override StatisticsPageState createState() => StatisticsPageState();
}

class StatisticsPageState extends State<StatisticsPage> {
  final List<Tab> _monthVsWeekTabs = <Tab>[
    Tab(text: "month"),
    Tab(text: "week"),
  ];

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
      ),
      body: DefaultTabController(
        length: _monthVsWeekTabs.length,
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: _monthVsWeekTabs,
              labelColor: Colors.blue,
            ),
            Container(
              // TODO: Put height that makes sense.
              height: 200,
              child: TabBarView(
                children: _monthVsWeekTabs.map((Tab tab) {
                  final String label = tab.text.toLowerCase();
                  return label == "month" ? MonthlyStatistics() : WeeklyStatistics();
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}