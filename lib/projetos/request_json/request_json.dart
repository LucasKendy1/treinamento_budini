// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:treinamento/components/fonte_padrao.dart';
import 'package:treinamento/components/header.dart';
import 'package:xml2json/xml2json.dart';

class JSONRequest extends StatefulWidget {
  @override
  State<JSONRequest> createState() => _JSONRequestState();
}

class _JSONRequestState extends State<JSONRequest> {
  var data;
  int selectedTire = 1;

  fetchData() async {
    var url =
        'https://demo.fleetsurvey.com/survey/wsrest.php/VehicleCompleteInspection';

    final Map<String, dynamic> payload = {
      "VEHICLECOMPLETEINSPECTION": {
        "SerialNumber": "AA99999998",
        "Email": "cristiana@apolosistemas.com.br",
        "WSType": 1,
        "FleetCode": "PDR12",
        "BranchCode": "XXX",
        "VehicleCode": "LLDR1521"
      }
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(payload),
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      print('Resposta: $responseData');

      return responseData;
    } else {
      print('Falha na requisição com status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: SafeArea(
          child: Container(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(children: [
                  Header(title: "JSON Request", navigator: "/menu"),
                  FutureBuilder(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Expanded(
                            child: Center(
                                child: CircularProgressIndicator(
                          color: Colors.white,
                        )));
                      } else {
                        var data = snapshot.data! as Map;
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            height: MediaQuery.of(context).size.height - 190,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.black,
                            child: Column(
                              children: [
                                Container(
                                  // color: Colors.red,
                                  child: Column(
                                    children: [
                                      FontePadrao(
                                        tamanho: 20,
                                        fw: FontWeight.w600,
                                        cor: Color(0xff27F3ED),
                                        text: "Dados para inspeção",
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FontePadrao(
                                              text:
                                                  "Tipo de Pressão: ${data['DADOSPARAINSPECAO']['TipoPressaoAr']}",
                                            ),
                                            FontePadrao(
                                              text:
                                                  "Tipo de Sulco: ${data['DADOSPARAINSPECAO']['TipoSulco']}",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: Color(0x3DFFFFFF)),
                                Container(
                                  // color: Colors.blue,
                                  child: Column(
                                    children: [
                                      FontePadrao(
                                        tamanho: 20,
                                        fw: FontWeight.w600,
                                        cor: Color(0xff27F3ED),
                                        text: "Veiculo",
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FontePadrao(
                                              text:
                                                  "Código do veículo: ${data['DADOSPARAINSPECAO']['VEICULO']['CodVeiculo']}",
                                            ),
                                            FontePadrao(
                                              text:
                                                  "QR Code: ${data['DADOSPARAINSPECAO']['VEICULO']['QRCode1']}",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: Color(0x3DFFFFFF)),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            // height: 100.h,
                                            // color: Colors.teal,
                                            child: FontePadrao(
                                              tamanho: 20,
                                              fw: FontWeight.w600,
                                              cor: Color(0xff27F3ED),
                                              text: "Pneu",
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            // color: Colors.amber,
                                            width: double.infinity,
                                            child: Center(
                                              child: DropdownButton<int>(
                                                dropdownColor: Colors.black26,
                                                value: selectedTire,
                                                items: List.generate(
                                                  9,
                                                  (index) => DropdownMenuItem(
                                                    value: index + 1,
                                                    child: Container(
                                                      color:
                                                          const Color.fromARGB(
                                                              0, 18, 14, 14),
                                                      child: Center(
                                                        child: Text(
                                                            style: TextStyle(
                                                                fontFamily: GoogleFonts
                                                                        .poppins()
                                                                    .fontFamily,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                fontSize: 20,
                                                                color: Color(
                                                                    0xff27F3ED)),
                                                            (index + 1)
                                                                .toString()),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onChanged: (value) {
                                                  selectedTire = value!;
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FontePadrao(
                                            text:
                                                "Sequencia Posição Inspeção: ${data['DADOSPARAINSPECAO']['VEICULO']['PNEU'][selectedTire - 1]['SeqPosInsp']}",
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FontePadrao(
                                                  text:
                                                      "Código de posição: ${data['DADOSPARAINSPECAO']['VEICULO']['PNEU'][selectedTire - 1]['CodPos']}"),
                                              FontePadrao(
                                                  text:
                                                      "ID do Pneu: ${data['DADOSPARAINSPECAO']['VEICULO']['PNEU'][selectedTire - 1]['TireID']}"),
                                            ],
                                          ),
                                          //
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ])),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0A2430),
                  Color(0xFF05455E),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ));
  }
}
