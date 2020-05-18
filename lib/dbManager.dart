import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  DBManager({this.tableName, this.c2name, this.c2type, this.c3name, this.c3type});
  static final _databaseName = 'localData.db';
  static final _databaseVersion = 1;
  final tableName, c2name, c2type, c3name, c3type;

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
      version: _databaseVersion,
      onCreate: _onCreate
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE $tableName (
            ID INTEGER PRIMARY KEY,
            $c2name $c2type NOT NULL,
            $c3name $c3type
        )'''
    );
  }

  Future<int> insert(Map<String, dynamic> row) async {
    return await _database.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query(tableName);
  }

  Future<int> delete(int id) async {
    return await _database.delete(tableName, where: 'ID = ?', whereArgs: [id]);
  }

  Future<int> update(Map<String, dynamic> row) async {
    int id = row[0];
    return await _database.update(tableName, row, where: 'ID = ?', whereArgs: [id]);
  }

  Future<int> smartAdd(Map<String, dynamic> row) async {
    final int id = row[0];
    var queryResult = await _database.rawQuery('SELECT * FROM $tableName WHERE ID="$id"');
    if (queryResult != null) {
      return insert(row);
    } else {
      return update(row);
    }
  }
}
