// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treinamento/projetos/estoque/custom_app_bar.dart';

class Finalizar extends StatelessWidget {
  const Finalizar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A2430),
          iconTheme: IconThemeData(color: Colors.white),
          title: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Finalizar",
              style: TextStyle(
                color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
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
        ),
      ),
    );
  }
}
