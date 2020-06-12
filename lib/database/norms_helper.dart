import 'package:sqflite/sqflite.dart';

import '../gen/calorie_counting.pb.dart';
import 'database_helper.dart';

class NormsHelper {
  static final tableName = "Norms";
  static final _instance = DatabaseHelper.instance;

  Future<int> insert(NutritionState norms) async {
    Database db = await _instance.database;
    return await db.insert(
        tableName, {"name": norms.name, "data": norms.writeToJson()},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(NutritionState norms) async {
    Database db = await _instance.database;
    return await db.update(
        tableName, {"name": norms.name, "data": norms.writeToJson()},
        where: 'name = "$norms.name"');
  }

  Future<NutritionState> getNorm(String name) async {
    Database db = await _instance.database;
    List<Map<String, dynamic>> result =
        await db.query(tableName, where: 'name = "$name"', limit: 1);
    return NutritionState.fromJson(result[0]['data']);
  }
}
