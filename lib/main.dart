import 'package:calorie_counting/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'dashboard.dart';
import 'date_picker.dart';
import 'gen/calorie_counting.pb.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  runApp(CalorieCountingApp());
}

class CalorieCountingApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Counting',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final log = Logger('_MyHomePageState');

  void _create_database() async {
    final log = Logger('DashboardWrapper');
    log.fine("message");
    var product = Product();
    product.name = "яблоко";
    product.carb = 100;
    var pHelper = ProductsHelper();
    pHelper.insert(product);
    var ret = await pHelper.queryAllRows();
    log.fine(" $ret ");
    var ret2 = await pHelper.searchByPrefix("я");
    log.fine("$ret2");
    var ret3 = await pHelper.searchByPrefix("y");
    log.fine("$ret3");
  }

  _onDateChanged(DateTime dateTime) {
    // TODO: Add date change handling events.
    log.fine("_onDateChanged, now it is " + dateTime.day.toString());
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementDate method above.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calorie Counting'),
        ),
      body: Column(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: <Widget> [
          DatePicker(
            onDateChanged: _onDateChanged,
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: DashboardWrapper(),
            ),
          ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {_create_database(); },
        tooltip: 'Add dish',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DashboardWrapper extends StatelessWidget {
  final log = Logger('DashboardWrapper');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {log.fine("DashboardWrapper tapped");},
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(
        ignoring: true,
        child: Container(
          color: Colors.redAccent,
            child: Dashboard(
              filledBar: 9,
              fullBar: 10,
            ),
       ),
      ),
    );
  }
}