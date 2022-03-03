import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/task.dart';

class DBHelper {
  static final dbname = "tasks.db";
  static final int _version = 2;
  static final String _tableName = "tasks";
  static final id = "id";
  static final title = "title";
  static final note = "note";
  static final date = "date";
  static final endTime = "endTime";
  static final startTime = "startTime";
  static final reminder = "reminder";
  static final repeat = "repeat";
  static final color = "color";
  static final isCompleted = "isCompleted";

  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initiateDatabase();
    return _database;
  }

  initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbname);
    return await openDatabase(path, version: _version, onCreate: onCreate);
  }

  Future onCreate(Database db, int _version) async {
    return await db.execute('''
         CREATE TABLE $_tableName (
      $id INTEGER PRIMARY KEY AUTOINCREMENT,
      $title STRING,$note TEXT,$date STRING,
      $startTime STRING,$endTime STRING,
      $reminder INTEGER,$repeat STRING,
      $color INTEGER,
      $isCompleted INTEGER)
      ''');
  }

  static Future<int> insert(Task task) async {
    print(task);
    Database? db = await instance.database;
    return await db?.insert(_tableName, task.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    Database? db = await instance.database;
    return await db!.query(_tableName);
  }

  static delete(Task task) async {
    Database? db = await instance.database;
    return await db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }

  static update(int id) async {
    Database? db = await instance.database;
    return await db!.rawUpdate('''
UPDATE tasks
SET isCompleted=?
WHERE id=?
''', [1, id]);
  }
}
