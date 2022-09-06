import 'package:flutter_application_11/models/admin_notification.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as pa;

class AdminNotificationDb {
  Database? _database;

  // create database connetion
  Future<Database> get database async {
    // location of database in device
    final dbpath = await getDatabasesPath();
    //name of the database
    const dbname = "adminnotification.db";
    // join dbpath and dbname to create a full path for database
    final path = pa.join(dbpath, dbname);
    //open connection
    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    return _database!;
  }

  // create separate database function
  // create table in database
  Future<void> _createDB(Database database, int version) async {
    await database.execute('''
  CREATE TABLE adminnotification(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  message TEXT,
  isChecked INTEGER
)
''');
// insert data in database
    Future<void> insert(AdminNotification adminnotification) async {
      // connection of database
      final db = await this.database;
      // insert data in database

      var result =
          await db.insert("adminnotification", adminnotification.toJson(),

              // replace duplicate value
              conflictAlgorithm: ConflictAlgorithm.replace);
      print("result:$result");
    }

    // delete data in database
    Future<void> delete(AdminNotification adminnotification) async {
      // connection of database
      final db = await this.database;
      // delete
      var result = await db.delete("adminnotification",
          where: "id==?", whereArgs: [adminnotification.id]);
      print(result);
    }

    //list the data
    Future<List<Map<String, dynamic>>> getAdmin() async {
      // connection of database
      final db = await this.database;
      List<Map<String, dynamic>> items = await db.query("adminnotification",
          orderBy: "id DESC"); // latest data on top
      return items;
    }
  }
}
