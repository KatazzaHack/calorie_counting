import 'package:flutter/material.dart';

import 'monthly_statistics.dart';
import 'weekly_statistics.dart';

class StatisticsPage extends StatefulWidget {
  @override
  StatisticsPageState createState() => StatisticsPageState();
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
