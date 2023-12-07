import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treinamento/main.dart';

class NumberPicker2 extends StatefulWidget {
  final String title;
  final List<String> numberList;

  NumberPicker2({required this.numberList, required this.title});

  late ValueNotifier<int> selectedIndexNotifier;
  String selected = '2';
  late int indexOriginal;
  late double x;
  late double y;
  late double z;
  late double middle;

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker2> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: 300 * 2, // Ajuste conforme necessário
    );

    widget.selectedIndexNotifier =
        ValueNotifier((widget.numberList.length / 2).round());
  }

  void scrollToMiddle() {
    print("ajustando z para o meio");

    double offset;
    double gap;

    gap = (widget.middle - widget.z).abs();
    print("gap($gap) = z(${widget.z}) - middle(${widget.middle})");

    if (widget.z > widget.middle) {
      offset = widget.z - gap;
    } else {
      offset = widget.z + gap;
    }

    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );

    // _scrollController.jumpTo(offset);
  }

  int getRealIndex(int adjustedIndex) {
    // Fórmula para calcular o índice real na lista original
    return adjustedIndex % widget.numberList.length;
  }

  void updateVisibleItemsPositions() {
    if (_scrollController.hasClients) {
      setState(() {
        widget.x = _scrollController.position.pixels;
        widget.y = (_scrollController.position.pixels + 165);
      });
    }
    widget.middle = (widget.x + widget.y) / 2;
    print("Valor de x: ${widget.x}");
    print("Valor do meio: ${widget.middle}");
    print("Valor de y: ${widget.y}");
  }

  void updateMainHeight() {
    setState(() {
      // Ajuste conforme necessário, considerando a altura real do item
      widget.z = widget.indexOriginal * 33;
    });
    print("Valor de z: ${widget.z}");
  }

  Widget renderizaLista() {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          updateVisibleItemsPositions();
          int middleIndex = (_scrollController.position.pixels +
                  _scrollController.position.viewportDimension / 2) ~/
              33;

          setState(() {
            widget.selectedIndexNotifier.value =
                middleIndex % widget.numberList.length;
            widget.selected = widget.numberList[getRealIndex(middleIndex)];
            atualizaNp.value = !atualizaNp.value;
          });
        }
        return false;
      },
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          widget.indexOriginal = index;
          int adjustedIndex = index % widget.numberList.length;
          String item = widget.numberList[adjustedIndex];

          return GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedIndexNotifier.value = adjustedIndex;
                widget.selected = item;
                atualizaNp.value = !atualizaNp.value;
              });
              updateMainHeight();
              scrollToMiddle();

              int realIndex = getRealIndex(adjustedIndex);
              print("Clicou no ${widget.numberList[realIndex]}");
              print("Índice real na lista original: $realIndex");
              print("Indice original: ${widget.indexOriginal}");
            },
            child: Container(
              width: 50.w,
              height: 33.h,
              // color: Colors.amberAccent,
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(
                    color: item == widget.selected
                        ? Color(0xff27F3ED)
                        : Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.title == "Points per section")
                Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 2,
                child: renderizaLista(),
              ),
              if (widget.title == "Points per section")
                Expanded(flex: 1, child: SizedBox()),
            ],
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(5),
          //       color: Color(0x3DFFFFFF),
          //     ),
          //     width: 50.w,
          //     height: 30.h,
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    widget.selectedIndexNotifier.dispose();
    super.dispose();
  }
}
