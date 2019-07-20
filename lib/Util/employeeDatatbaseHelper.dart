import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:appnew/model/employee.dart';

class EmployeeDatatbaseHelper {
  final String employeeTable = "employeeTb";
  final String columnId = "id";
  final String columnName = "name";
  final String columnEmail = "email";
  final String columnDepartment = "department";
  final String columnAge = "age";
  final String columnDescription = "description";

  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'employee.db');
    var db = openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newversion) async {
    var sql =
        "CREATE TABLE $employeeTable($columnId INTEGER PRIMARY KEY , $columnName TEXT, $columnEmail TEXT , $columnDepartment TEXT , $columnAge TEXT, $columnDescription TEXT )";
    return db.execute(sql);
  }

  Future<int> saveEmployee(Employee employee) async {
    var dbclient = await db;
    var result = dbclient.insert(employeeTable, employee.toMap());
    return result;
  }

  Future<List> getAllEmployee() async {
    var dbclient = await db;
    var result = await dbclient.query(employeeTable, columns: [
      columnId,
      columnName,
      columnEmail,
      columnDepartment,
      columnAge,
      columnDescription
    ]);
    return result.toList();
  }

  Future<int> getCountEmployee() async {
    var dbclient = await db;
    return Sqflite.firstIntValue(
        await dbclient.rawQuery('Select COUNT(*) FROM $employeeTable'));
  }

  Future<Employee> getEmployee(int id) async {
    var dbclient = await db;

    List<Map> result = await dbclient.query(employeeTable,
        columns: [
          columnId,
          columnName,
          columnEmail,
          columnDepartment,
          columnAge,
          columnDescription
        ],
        where: "$columnId= ?",
        whereArgs: [id]);
    if (result.length > 0) {
      return Employee.fromMap(result.first);
    }
    return null;
  }

  Future<int> updateEmployee(Employee employee) async {
    var dbClient = await db;
    return await dbClient.update('$employeeTable', employee.toMap(),
        where: "$columnId = ?", whereArgs: [employee.id]);
  }
  
  Future<int> deleteEmployee(int id) async {
    var dbClient = await db;
    return await dbClient.delete('$employeeTable',
        where: "$columnId = ?", whereArgs: [id]);
  }


  Future close() async {
    var dbClient = await db;
    return await dbClient.close();
  }
}
