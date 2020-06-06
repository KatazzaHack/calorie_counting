import 'dart:io';
import 'dart:async';

import 'package:calorie_counting/gen/calorie_counting.pb.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class DatabaseHelper {
  static final _databaseName = "calorie_test90.db";
  static final _databaseVersion = 1;

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE Norms ( _id INTEGER PRIMARY KEY, name TEXT NOT NULL UNIQUE, data BLOB)");
    await db.execute("CREATE TABLE Products ( _id INTEGER PRIMARY KEY, name TEXT NOT NULL UNIQUE, data BLOB)");
    await db.execute("CREATE TABLE MealLog ( _id INTEGER PRIMARY KEY, timestamp INTEGER, data BLOB)");
    await db.execute("CREATE TABLE Dishes ( _id INTEGER PRIMARY KEY, name TEXT NOT NULL UNIQUE, data BLOB)");
    await _addRusCal(db);
    await _addEngCal(db);
    await _addNorm(db);
  }

  Future _addNorm(Database db) async {
    Norms norms = Norms();
    norms.name = "defaultUser";
    norms.carbonates = 200;
    norms.fats = 80;
    norms.proteins = 140;
    norms.calories = 2300;
    norms.water = 3000;
    db.insert("Norms", {"name": norms.name, "data": norms.writeToJson()});
  }

  Future _addRusCal(Database db) async {
    String rusCal = await rootBundle.loadString('assets/cal_rus.csv');
    List data = rusCal.split('\n');
    data.forEach((line) {
      List row = line.split(';');
      Product product = Product();
      product.name = row[0].toLowerCase();
      product.protein = double.parse(row[1]);
      product.carbonates = double.parse(row[3]);
      product.calorie = double.parse(row[4]);
      product.fat = double.parse(row[2]);
      db.insert(
          "Products", {"name": product.name, "data": product.writeToJson()},
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future _addEngCal(Database db) async {
    return;
    String rusCal = await rootBundle.loadString('assets/new_cal_eng.csv');
    List data = rusCal.split('\n');
    data.forEach((line) {
      List row = line.split(';');
      Product product = Product();
      product.name = row[0].toLowerCase();
      product.protein = double.parse(row[2]);
      product.carbonates = double.parse(row[4]);
      product.calorie = double.parse(row[1]);
      product.fat = double.parse(row[3]);
      db.insert(
          "Products", {"name": product.name, "data": product.writeToJson()},
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }
}
