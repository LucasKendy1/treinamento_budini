import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TituloIcone extends StatelessWidget {
  final String text;
  final Color cor;
  const TituloIcone({super.key, required this.text, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: cor),
    );
  }
}
