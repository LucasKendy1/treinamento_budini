import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchBudini extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  SwitchBudini({required this.value, required this.onChanged});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<SwitchBudini> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 55, // Largura total do switch
        height: 30, // Altura total do switch
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.sp),
          color: widget.value
              ? Color(0xff27F3ED)
              : Color(0x47000000), // Cor de fundo do switch
        ),
        child: Row(
          mainAxisAlignment:
              widget.value ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 26, // Largura do polegar (thumb)
              height: 26, // Altura do polegar (thumb)
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
