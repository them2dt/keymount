import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Account {
  final int? id;
  final String title;
  final String username;
  final String password;

  Account(
      {this.id,
      required this.title,
      required this.username,
      required this.password});

  factory Account.fromMap(Map<String, dynamic> json) => Account(
        id: json['id'],
        title: json['title'],
        username: json['username'],
        password: json['password'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'username': username,
      'password': password,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'accounts.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(''' CREATE TABLE accounts(
      id INTEGER PRIMARY KEY,
      title TEXT,
      username TEXT,
      password TEXT
    )
    ''');
  }

  Future<List<Account>> getAccounts() async {
    Database db = await instance.database;
    var accounts = await db.query('accounts', orderBy: 'name');
    List<Account> accountList = accounts.isNotEmpty
        ? accounts.map((c) => Account.fromMap(c)).toList()
        : [];
    return accountList;
  }

  Future<int> add(Account account) async {
    Database db = await instance.database;
    return await db.insert('accounts', account.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return db.delete('accounts', where: 'id=?', whereArgs: [id]);
  }

  Future<int> getCount() async {
    Database db = await instance.database;
    var result = await db.query('accounts');
    int count = result.length;
    return count;
  }
}
