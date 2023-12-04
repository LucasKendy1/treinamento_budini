// ignore_for_file: unused_import, depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? db;

  Future<Database> createTable() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'treinamento.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, adress TEXT, phone TEXT, hour TEXT)', //hour TEXT
        );
      },
      version: 2,
    );
    print('Database path: ${await getDatabasesPath()}');
    print("Database criada!");
    // db = database as Database?;
    return database;
  }

  Future<void> insertUser(user, Database database, id) async {
    final db = await database;
    await db.insert('users', {
      'hour': DateFormat('HH:mm').format(DateTime.now()),
      'name': user["nome"],
      'adress': user["endereco"],
      'phone': user["telefone"],
    });
  }

  Future<List<Map<String, dynamic>>> users(Database database) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(
      maps.length,
      (i) {
        return {
          "id": maps[i]['id'],
          "nome": maps[i]['name'],
          "endereco": maps[i]['adress'],
          "telefone": maps[i]['phone'],
          "hour": maps[i]['hour'],
        };
      },
    );
  }

  Future<void> updateUser(int id, String name, String adress, String phone,
      Database database) async {
    final db = await database;
    await db.update(
      'users',
      {
        "name": name,
        "adress": adress,
        "phone": phone,
        "hour": DateFormat('HH:mm').format(DateTime.now()),
      },
      where: 'id=?',
      whereArgs: [id], //valores antigos
    );
  }

  Future<void> deleteUser(int id, Database database) async {
    final db = await database;

    await db.delete(
      'users',
      where: 'id=?',
      whereArgs: [id],
    );
  }
}
