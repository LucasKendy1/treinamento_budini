// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, curly_braces_in_flow_control_structures, avoid_unnecessary_containers, unnecessary_import, unused_import
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:treinamento/projetos/estoque/custom_app_bar.dart';
import 'package:treinamento/components/custom_button.dart';
import 'package:treinamento/projetos/estoque/database_service.dart';
import 'package:treinamento/components/input_edit_field.dart';
import 'package:treinamento/components/input_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.banco});
  final Database banco;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  late TextEditingController adressController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController nameEditController = TextEditingController();
  late TextEditingController adressEditController = TextEditingController();
  late TextEditingController phoneEditController = TextEditingController();

  List<Map<String, dynamic>> userInfo = [];

  Map<String, dynamic> editUser = {
    "nome": "",
    "endereco": "",
    "telefone": "",
  };

  Future<void> _save() async {
    //função que adiciona um Map na lista userInfo
    userInfo.add({
      "nome": nameController.text,
      "endereco": adressController.text,
      "telefone": phoneController.text,
    });
    await DatabaseHelper().insertUser(
        userInfo.last, widget.banco, userInfo.length - 1); //inserindo no banco

    nameController.clear();
    adressController.clear();
    phoneController.clear();

    // print("contato salvo!");
    // print(userInfo);
    setState(() {});
  }

  void edit(Map user, int index, context) {
    //função que edita abrindo a AlertBox
    showDialog(
      context: context,
      builder: (_) => Theme(
        data: ThemeData(
          useMaterial3: false,
        ),
        child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            backgroundColor: Color(0xFFFFFFFF),
            title: Container(
              color: Color(0xffFFFFFF),
              child: Text(
                "Editar ",
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            content: alert(user, context)),
      ),
    ).then((value) async {
      // print("Valor do value: $value");
      if (value["nome"].isNotEmpty) userInfo[index]["nome"] = value["nome"];
      if (value["endereco"].isNotEmpty)
        userInfo[index]["endereco"] = value["endereco"];
      if (value["telefone"].isNotEmpty)
        userInfo[index]["telefone"] = value["telefone"];
      await DatabaseHelper().updateUser(
        userInfo[index]["id"],
        userInfo[index]["nome"],
        userInfo[index]["endereco"],
        userInfo[index]["telefone"],
        widget.banco,
      );
    });
  }

  Future<void> save(Map user, context) async {
    //função que salva a edição da função edit
    substitute(user);
    Navigator.pop(context, editUser);
  }

  substitute(Map user) {
    //função que substitui os valores do indice de userInfo com as informações dos edits controllers
    final String n = user["nome"];
    final String e = user["endereco"];
    final String t = user["telefone"];

    // print(nameEditController.text);
    // print(adressEditController.text);
    // print(phoneEditController.text);

    setState(() {
      // userInfo[index]["name"] = editUser["nome"];
      // userInfo[index]["endereco"] = editUser["endereco"];
      // userInfo[index]["telefone"] = editUser["telefone"];

      if (nameEditController.text == "") {
        user["nome"] = n;
      } else {
        user["nome"] = nameEditController.text;
      }
      if (adressEditController.text == "") {
        user["endereco"] = e;
      } else {
        user["endereco"] = adressEditController.text;
      }
      if (phoneEditController.text == "") {
        user["telefone"] = t;
      } else {
        user["telefone"] = phoneEditController.text;
      }
      nameEditController.clear();
      adressEditController.clear();
      phoneEditController.clear();
    });
  }

  Future<void> delete(Map user, int index) async {
    try {
      await DatabaseHelper().deleteUser(user["id"], widget.banco);
      userInfo.removeAt(index);

      setState(() {});
    } catch (e) {
      print("Erro $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xFF0A2430),
              Color(0xFF05455E),
              // Colors.black12,
              // Colors.black26
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            children: [
              CustomAppBar(
                count: userInfo.length,
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    //Conteudo
                    children: [
                      FutureBuilder(
                          future: DatabaseHelper().users(widget.banco),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasError) {
                              return Text(
                                snapshot.error.toString(),
                              );
                            } else {
                              userInfo = snapshot.data!;
                              return Center(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 543,
                                    // color: Colors.amber,
                                    child: userInfo.isNotEmpty
                                        ? ListView.builder(
                                            // reverse: true,
                                            itemCount: userInfo.length,
                                            itemBuilder: (context, index) {
                                              if (index == 0) {
                                                userInfo =
                                                    userInfo.reversed.toList();
                                              }
                                              return card(
                                                context,
                                                userInfo[index]["nome"],
                                                userInfo[index]["endereco"],
                                                userInfo[index]["telefone"],
                                                userInfo[index]["hour"],
                                                userInfo,
                                                index,
                                              );
                                            })
                                        : Container(),
                                  ),
                                ),
                              );
                            }
                          }),
                    ],
                  )),
            ],
          ),
        ),
        bottomNavigationBar: footer(),
      ),
    );
  }

  alert(Map user, context) {
    //Widget que retorna o AlertBox que pede as informações de edição de conteudo
    return Container(
      color: Colors.white,
      height: 330,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(children: [
              InputEditField(
                text: "Nome",
                hint: user["nome"],
                controller: nameEditController,
              ),
              SizedBox(
                height: 16,
              ),
              InputEditField(
                text: "Endereço",
                hint: user["endereco"],
                controller: adressEditController,
              ),
              SizedBox(
                height: 16,
              ),
              InputEditField(
                text: "Telefone",
                hint: user["telefone"],
                controller: phoneEditController,
              ),
            ]),
          ),
          Button(
            text: "editar",
            onPressed: () {
              save(user, context);
            },
          ),
        ],
      ),
    );
  }

  footer() {
    return Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Input(text: "Nome", controller: nameController)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Input(
                        text: "Endereço",
                        controller: adressController,
                      ),
                    ),
                  ),
                ],
              ),
            ), //nome, endereco
            SizedBox(
              width: 24,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      child:
                          Input(text: "Telefone", controller: phoneController)),
                  SizedBox(
                    height: 19,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Button(
                      text: "adicionar",
                      onPressed: _save,
                    ),
                  ),
                ],
              ),
            ), //telefone, adicionar
          ],
        ),
      ),
    );
  }

  card(context, nome, endereco, telefone, horario, userInfo, index) {
    return Container(
      // color: Colors.amberAccent,
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    // color: Colors.blueGrey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            horario,
                            style: TextStyle(
                              color: Color(0x8AFFFFFF),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Text(
                                    nome,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Text(
                                    endereco,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    telefone,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Center(
                              child: GestureDetector(
                                //dar reverse no index tbm
                                onTap: () {
                                  edit(userInfo[index], index, context);
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Color(0xFF27F3ED),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  delete(userInfo[index], index);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Color(0xFFF32766),
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Divider(
                height: 1,
                color: Color(0x3DFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
