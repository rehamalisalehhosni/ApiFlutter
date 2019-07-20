import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:appnew/model/User.dart';

class datatbaseHelper {
  static Database _db;
  final String usertable = 'usertable';
  final String columnId = 'id';
  final String columName = 'name';
  final String columEmail = 'email';
  final String columPass = 'password';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      return _db;
    }
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'mydb.db');
    var myOwnDb = await openDatabase(path, version: 1, onCreate: _oncreate);
    return myOwnDb;
  }

  void _oncreate(Database db, int newversion) async {
    var sql =
        "CREATE TABLE $usertable($columnId INTEGER PRIMARY KEY, $columName TEXT, $columEmail TEXT , $columPass TEXT )";
    return db.execute(sql);
  }

  Future<int> SaveUser(User user) async {
    var dbClient = await db;
    int result = await dbClient.insert('$usertable', user.toMap());
    return result;
  }

  Future<List> getAllUsers() async {
    var dbClient = await db;
    String sql = "Select * FROM $usertable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<int> getAllUsersCount() async {
    var dbClient = await db;
    String sql = "Select COUNT(*) FROM $usertable";
    return Sqflite.firstIntValue(await dbClient.rawQuery(sql));
  }

  Future<User> getUser(int id) async {
    var dbClient = await db;
    String sql = "Select * FROM $usertable WHERE $columnId= $id";
    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) {
      return null;
    }
    return new User.fromMap(result.first);
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete('$usertable', where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> UpdateUser(User user) async {
    var dbClient = await db;
    return await dbClient.update('$usertable', user.toMap(),
        where: "$columnId = ?", whereArgs: [user.id]);
  }

  Future close() async {
    var dbClient = await db;
    return await dbClient.close();
  }
}
