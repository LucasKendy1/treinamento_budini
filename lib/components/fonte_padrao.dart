import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FontePadrao extends StatelessWidget {
  final String text;
  final Color? cor;
  final double? tamanho;
  final TextAlign? txtalg;
  final FontWeight? fw;
  const FontePadrao(
      {super.key,
      required this.text,
      this.cor,
      this.tamanho,
      this.txtalg,
      this.fw});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
      child: Text(
        text,
        textAlign: txtalg != null ? txtalg : TextAlign.start,
        style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: tamanho != null ? tamanho?.sp : 16.sp,
            fontWeight: fw != null ? fw : FontWeight.w500,
            color: cor != null ? cor : Colors.white),
      ),
    );
  }
}
