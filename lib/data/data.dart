import 'package:keymount_v2/model/item.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:core';

class ItemDatabase {
  static final ItemDatabase instance = ItemDatabase._init();
  static Database? _database;
  ItemDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INT PRIMARY KEY AUTOINCREMENT';
    final stringType = 'TEXT NOT NULL';
    await db.execute('''
    CREATE TABLE $tableItem(
     ${ItemFields.id} $idType,
     ${ItemFields.title} $stringType,
     ${ItemFields.username} $stringType,
     ${ItemFields.password} $stringType
    ) ''');
  }

  Future<void> create(String title, String username, String password) async {
    final String _title = title;
    final String _username = username;
    final String _password = password;

    final db = await instance.database;
    final id = await db.rawInsert(
        'INSERT INTO $tableItem (${ItemFields.title}, ${ItemFields.username}, ${ItemFields.password}) VALUES ($_title,$_username,$password) ');

    print("ID:");
    print(id);
  }

  Future<List<Item>> read() async {
    final db = await instance.database;
    final result = await db.query(tableItem, orderBy: '${ItemFields.id} ASC');

    return result.map((json) => Item.fromJson(json)).toList();
  }

  Future<int> update(Item item) async {
    final db = await instance.database;
    return db.update(
      tableItem,
      item.toJson(),
      where: '${ItemFields.id}=?',
      whereArgs: [item.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete(
      tableItem,
      where: '${ItemFields.id}=?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
