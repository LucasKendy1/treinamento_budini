import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClockWiseButton extends StatelessWidget {
  final topRight;
  final bottomRight;
  final topLeft;
  final bottomLeft;
  final bool clockwise;
  final String imagePath;
  final onTapCallBack;

  const ClockWiseButton({
    Key? key,
    required this.clockwise,
    required this.imagePath,
    required this.onTapCallBack,
    required this.topRight,
    required this.bottomRight,
    required this.topLeft,
    required this.bottomLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft.toDouble()),
          bottomLeft: Radius.circular(bottomLeft.toDouble()),
          topRight: Radius.circular(topRight.toDouble()),
          bottomRight: Radius.circular(bottomRight.toDouble())),
      child: InkWell(
        onTap: onTapCallBack,
        child: Container(
          width: 30.w,
          height: 30.h,
          color: clockwise ? Color(0xff27F3ED) : Color(0x8AFFFFFF),
          child: Center(
            child: Image.asset(
              imagePath,
              width: 25.w,
              height: 25.h,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
