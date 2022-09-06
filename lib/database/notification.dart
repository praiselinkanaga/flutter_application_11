import 'package:sqflite/sqflite.dart';

class NotificationHelper {
  void myFunction() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';
    print(path);

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      //When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, message TEXT)');
      print("database created");
    });

    await database.transaction((txn) async {
      // int id1 = await txn.rawInsert(
      //     'INSERT INTO Test(name, message) VALUES("Praise", "hello")');
      // print('inserted1: $id1');
      // int id6 = await txn.insert("Test", {"name": "another", "message": "hai"});

      // int id6 = await txn.rawInsert(
      //     'INSERT INTO Test(name, message) VALUES(?, ?)',
      //     ['another name', "Hai"]);
      //print('inserted2: $id6');
    });

    int update = await database.update(
        "Test", {"name": "kanaga", "message": "super"},
        where: "id=?", whereArgs: [1]);
    print('updated: $update');
    int delete = await database.delete("Test", where: "id=?", whereArgs: [3]);
    print(delete);

    List<Map> list = await database.rawQuery('SELECT * FROM Test');
    print(list);

    var count = Sqflite.firstIntValue(
        await database.rawQuery('SELECT COUNT(*) FROM Test'));
    print(count);
  }
}
