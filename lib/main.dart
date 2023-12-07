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
import 'package:treinamento/projetos/request_json/request_json.dart';
import 'package:treinamento/projetos/request_xml/request_xml.dart';

Database? banco;
ValueNotifier<bool> atualizaNp = ValueNotifier(false);
ValueNotifier<bool> atualizaTire = ValueNotifier(false);

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
      home: JSONRequest(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/menu': (context) => Menu(),
        '/home': (context) => HomePage(banco: banco!),
        '/finalizar': (context) => Finalizar(),
        '/chassi': (context) => Chassi(),
        '/inspection': (context) => Inspection(),
        '/xml': (context) => XmlRequest(),
        '/json': (context) => JSONRequest(),
      },
    );
  }
}
