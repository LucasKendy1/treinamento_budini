// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treinamento/components/fonte_padrao.dart';
import 'package:treinamento/components/titulo.dart';
import 'package:treinamento/components/titulo_com_icone.dart';

class Header extends StatelessWidget {
  final String title;
  final String navigator;
  const Header({super.key, required this.title, required this.navigator});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0A2430),
      width: double.infinity,
      height: 48.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, navigator);
            },
            child: Container(
              // color: Colors.amber,
              width: 48.w,
              height: 48.h,
              child: GestureDetector(
                child: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: TituloIcone(text: title, cor: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
