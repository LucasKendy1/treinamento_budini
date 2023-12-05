// ignore_for_file: await_only_futures, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:treinamento/projetos/chassi/chassi.dart';
import 'package:treinamento/projetos/chassi/controller.dart';
import 'package:treinamento/projetos/estoque/database_service.dart';
import 'package:treinamento/projetos/estoque/home_page.dart';
import 'package:provider/provider.dart';
import 'package:treinamento/projetos/estoque/finalizar.dart';
import 'package:treinamento/pages/menu.dart';
import 'package:treinamento/projetos/inspection/inspection.dart';

Database? banco;

Future<void> main() async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  banco = await databaseHelper.createTable();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(
      //   banco: banco!,
      // ),
      home: Inspection(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/menu': (context) => Menu(),
        '/home': (context) => HomePage(banco: banco!),
        '/finalizar': (context) => Finalizar(),
        '/chassi': (context) => Chassi(),
        '/inspection': (context) => Inspection(),
      },
    );
  }
}
