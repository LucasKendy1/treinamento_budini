// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Titulo extends StatelessWidget {
  final String text;
  final Color? cor;
  final double? tamanho;
  final TextAlign? txtalg;
  final FontWeight? weight;
  const Titulo(
      {super.key,
      required this.text,
      this.cor,
      this.tamanho,
      this.txtalg,
      this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: txtalg != null ? txtalg : TextAlign.start,
      style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: tamanho != null ? tamanho?.sp : 16.sp,
          fontWeight: weight != null ? weight : FontWeight.w400,
          color: cor != null ? cor : Colors.white),
    );
  }
}
