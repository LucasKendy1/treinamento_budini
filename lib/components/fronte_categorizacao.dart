import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Categorization extends StatelessWidget {
  final String text;
  final Color? cor;
  final double? tamanho;
  final TextAlign? txtalg;

  const Categorization(
      {super.key, required this.text, this.cor, this.tamanho, this.txtalg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
      child: Text(
        text,
        textAlign: txtalg != null ? txtalg : TextAlign.start,
        style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: tamanho != null ? tamanho?.sp : 34.sp,
            fontWeight: FontWeight.w400,
            color: cor != null ? cor : Color(0xff27F3ED)),
      ),
    );
  }
}
