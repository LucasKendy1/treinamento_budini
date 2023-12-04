// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treinamento/components/fonte_padrao.dart';
import 'package:treinamento/components/titulo.dart';

class ButtonSwitch extends StatefulWidget {
  final bool isToggled;
  final String text;
  final onTapCallBack;

  const ButtonSwitch(
      {super.key,
      required this.text,
      this.onTapCallBack,
      required this.isToggled});

  @override
  State<ButtonSwitch> createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<ButtonSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapCallBack,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(width: 2, color: Color(0xff27F3ED)),
            color: widget.isToggled ? Color(0xff27F3ED) : Color(0xff2D3442)),
        width: 200.w,
        height: 30.h,
        child: Center(
          child: Titulo(
            weight: FontWeight.w600,
            tamanho: 14,
            text: widget.text,
            cor: widget.isToggled ? Color(0xff2D3442) : Colors.white,
          ),
        ),
      ),
    );
  }
}
