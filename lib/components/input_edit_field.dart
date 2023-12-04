// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputEditField extends StatelessWidget {
  final String text;
  final String hint;
  final TextEditingController controller;
  const InputEditField(
      {super.key,
      required this.text,
      required this.controller,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xFF22D3442)),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  style: BorderStyle.solid,
                  color: Color(0xFF2D34421F),
                  width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                controller: controller,
                style: TextStyle(
                  color: Color(0xFF2D3442),
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  border:
                      InputBorder.none, // Remove a borda padrão do TextField
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
