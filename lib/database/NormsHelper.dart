import 'package:sqflite/sqflite.dart';

import '../gen/calorie_counting.pb.dart';
import 'database_helper.dart';

class NormsHelper {
  static final tableName = "Norms";
  static final _instance = DatabaseHelper.instance;

  Future<int> insert(Norms norms) async {
    Database db = await _instance.database;
    return await db.insert(tableName,
        {
          "name": norms.name,
          "data": norms.writeToJson()
        }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(Norms norms) async {
    Database db = await _instance.database;
    return await db.update(tableName,
        {
          "name": norms.name,
          "data": norms.writeToJson()
        }, where: 'name = "$norms.name"'
    );
  }
}