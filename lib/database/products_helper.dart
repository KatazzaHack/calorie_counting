import 'package:sqflite/sqflite.dart';
import '../gen/calorie_counting.pb.dart';
import 'database_helper.dart';

class ProductsHelper {
  static final tableName = "Products";
  static final _instance = DatabaseHelper.instance;

  Future<int> insert(Product product) async {
    Database db = await _instance.database;
    return await db.insert(
        tableName, {"name": product.name, "data": product.writeToJson()},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Product>> searchByPrefix(String prefix) async {
    Database db = await _instance.database;
    List<Map<String, dynamic>> result =
        await db.query(tableName, where: 'name LIKE "$prefix%"', limit: 20);
    return List.generate(result.length, (i) {
      return Product.fromJson(result[i]['data']);
    });
  }

  Future<List<Product>> searchBySubstring(String substring) async {
    Database db = await _instance.database;
    List<Map<String, dynamic>> result =
        await db.query(tableName, where: 'name LIKE "%$substring%"', limit: 20);
    return List.generate(result.length, (i) {
      return Product.fromJson(result[i]['data']);
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await _instance.database;
    return await db.query(tableName);
  }
}
