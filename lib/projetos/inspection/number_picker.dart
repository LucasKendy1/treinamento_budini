// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treinamento/main.dart';

class NumberPicker extends StatefulWidget {
  final String title;
  final List<String> numberList;

  NumberPicker({required this.numberList, required this.title});

  late String selected = '2';

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  final ScrollController _scrollController = ScrollController();
  late List<String> infiniteList;
  int selectedIndex = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double _calculateMiddlePosition() {
    final itemHeight = 38.0;
    final itemCount = infiniteList.length;
    final totalHeight = itemHeight * itemCount;
    final middlePosition = totalHeight / 2.0;

    return middlePosition;
  }

  @override
  void initState() {
    super.initState();

    infiniteList = List.generate(
      10000,
      (index) => widget.numberList[index % widget.numberList.length],
    );

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final double middlePosition = _calculateMiddlePosition();
      _scrollController.jumpTo(middlePosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.title == "Points per section")
              Expanded(child: SizedBox()),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                controller: _scrollController,
                itemCount: infiniteList.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index % widget.numberList.length;
                            widget.selected = infiniteList[index];
                            print(widget.selected);
                            atualizaNp.value = !atualizaNp.value;
                          });

                          // Calcular o deslocamento para rolar o item selecionado para o meio
                          final itemHeight = 38; // Altura média de um item
                          final middlePosition = _calculateMiddlePosition() +
                              (itemHeight * selectedIndex);
                          _scrollController.jumpTo(middlePosition);

                          // Rolar para o meio
                          _scrollController.animateTo(
                            middlePosition,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.transparent),
                          width: 40.w,
                          height: 30.h,
                          child: Text(
                            infiniteList[index],
                            style: TextStyle(
                              color: index % widget.numberList.length ==
                                      selectedIndex
                                  ? Color(0xff27F3ED)
                                  : Colors.white,
                              fontSize: index % widget.numberList.length ==
                                      selectedIndex
                                  ? 16.sp
                                  : 14.sp,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (widget.title == "Points per section")
              Expanded(child: SizedBox()),
          ],
        ),
        Container(
          width: 50.w,
          height: 35.h,
          decoration: BoxDecoration(
            color: Color(0x3DFFFFFF),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
