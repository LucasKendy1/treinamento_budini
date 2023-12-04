import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberDot extends StatelessWidget {
  final bool active;
  final int number;
  final VoidCallback onTap;

  const NumberDot(
      {super.key,
      required this.active,
      required this.number,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(1),
        child: Container(
          padding: EdgeInsets.zero,
          width: 22.w,
          height: 22.h,
          decoration: BoxDecoration(
            color: active ? Color(0xff27F3ED) : Colors.black,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: TextStyle(
                color: active ? Color(0xff2D3442) : Colors.white,
                fontSize: 15.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
