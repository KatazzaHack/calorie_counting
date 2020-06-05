import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';
import 'gen/calorie_counting.pb.dart';


class DatabaseHelper {

  static final _databaseName = "calorie_test1.db";
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
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE Products ( _id INTEGER PRIMARY KEY, name TEXT NOT NULL UNIQUE, data BLOB);
          CREATE TABLE MealLog ( _id INTEGER PRIMARY KEY, timestamp INTEGER, data BLOB);
          CREATE TABLE Dishes ( _id INTEGER PRIMARY KEY, name TEXT NOT NULL UNIQUE, data BLOB);
          ''');
  }
}

class ProductsHelper {
  static final tableName = "Products";
  static final _instance = DatabaseHelper.instance;

  Future<int> insert(Product product) async {
    Database db = await _instance.database;
    return await db.insert(tableName,
        {
          "name": product.name,
          "data": product.writeToJson()
        }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Product>> searchByPrefix(String prefix) async {
    Database db = await _instance.database;
    List<Map<String, dynamic>> result = await db.query(
        tableName,
        where: 'name LIKE "$prefix%"',
        limit: 20
    );
    return List.generate(result.length, (i) {
      return Product.fromJson(result[i]['data']);
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await _instance.database;
    return await db.query(tableName);
  }
}