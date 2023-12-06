import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treinamento/main.dart';

class NumberPicker2 extends StatefulWidget {
  final String title;
  final List<String> numberList;

  NumberPicker2({required this.numberList, required this.title});

  late ValueNotifier<int> selectedIndexNotifier;
  String selected = '2';
  int index = 0;

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker2> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: 1000 * 30.0, // Ajuste conforme necessário
    );

    widget.selectedIndexNotifier =
        ValueNotifier((widget.numberList.length / 2).round());
  }

  void scrollToMiddle() {
    double offset = widget.selectedIndexNotifier.value * 35;
    print("valor do index global: $widget.index");
    print(
        'valor do selectIndexNotifier : ${widget.selectedIndexNotifier.value}');
    _scrollController.jumpTo(offset);
  }

  int getRealIndex(int adjustedIndex) {
    // Fórmula para calcular o índice real na lista original
    return adjustedIndex % widget.numberList.length;
  }

  Widget renderizaLista() {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          // Faça algo quando a lista estiver rolando
          // Por exemplo, você pode acessar scrollNotification.metrics para obter informações sobre a rolagem
          int adjustedIndex = widget.index % widget.numberList.length;
          int realIndex = getRealIndex(adjustedIndex);
          print("Índice real na lista original: $realIndex");
          widget.selected = widget.numberList[realIndex];
          atualizaNp.value = !atualizaNp.value;
        }
        return false;
      },
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        // itemCount: widget.numberList.length,
        itemBuilder: (context, index) {
          int adjustedIndex = index % widget.numberList.length;
          String item = widget.numberList[adjustedIndex];
          widget.index = adjustedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedIndexNotifier.value = adjustedIndex;
                widget.selected = item;
                print(widget.selected);
                atualizaNp.value = !atualizaNp.value;
              });
              scrollToMiddle();

              // Obtém o índice real na lista original
              int realIndex = getRealIndex(adjustedIndex);
              print("Índice real na lista original: $realIndex");
            },
            child: Container(
              width: 50.w,
              height: 33.h,
              // color: Colors.black38,
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
      // color: Colors.black12
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
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0x3DFFFFFF),
              ),
              width: 50.w,
              height: 30.h,
            ),
          ),
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
