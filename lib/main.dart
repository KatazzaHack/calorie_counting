import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'home_page.dart';
import 'database/ProductsHelper.dart';
import 'statistics_page.dart';

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

enum PageType {
  home,
  statistics,
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

  DateTime _dateTime = new DateTime.now();

  void _createDatabase() async {
    final log = Logger('DashboardWrapper');
    log.fine("Start creating database");
    ProductsHelper productHelper = ProductsHelper();
    final foo = await productHelper.searchByPrefix("ябл");
    log.fine("Created database $foo");
  }

  void _onPageChanged(PageType pageType) {
    // TODO: Handle page change.
//    if (pageType == PageType.statistics) {
//
//    }
    log.fine("_onPageChanged, now page = " + pageType.toString());
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementDate method above.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie Counting'),
      ),
//      body: HomePage(
//        onPageChanged: _onPageChanged,
//      ),
      body: StatisticsPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () { _createDatabase(); },
        tooltip: 'Add dish',
        child: Icon(Icons.add),
      ),
    );
  }
}