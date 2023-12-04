// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treinamento/components/titulo.dart';

class FullButtonPadrao extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const FullButtonPadrao({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 32.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(width: 2, color: Color(0xff27F3ED)),
              color: Color(0xff27F3ED)),
          child: Titulo(
            weight: FontWeight.w600,
            tamanho: 16,
            text: text,
            cor: Color(0xff2D3442),
            txtalg: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
