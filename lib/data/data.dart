import 'package:sqflite/sqflite.dart';

class Data {
  var databasePath;
  Data() {
    initData();
  }
  void printPath() {
    print("Database Path: " + databasePath);
  }

  initData() async {
    this.databasePath = await getDatabasesPath();
  }
}
