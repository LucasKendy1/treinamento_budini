// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treinamento/components/default_button.dart';
import 'package:treinamento/components/fonte_padrao.dart';
import 'package:treinamento/components/fronte_categorizacao.dart';
import 'package:treinamento/components/header.dart';
import 'package:treinamento/components/switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Inspection extends StatefulWidget {
  const Inspection({super.key});

  @override
  State<Inspection> createState() => _InspectionState();
}

class _InspectionState extends State<Inspection> {
  bool switchValue = false;

  List<String> sections = ['1', '2', '3', '4', '5', '6', '7', '8'];
  List<String> points = ['1', '2'];
  List<String> threads = ['1', '2', '3', '4', '5', '6', '7', '8', 'auto'];

  String selectedSection = '8';
  String selectedPoint = '2';
  String selectedThread = '5';

  switchSvg() {
    switch (selectedSection) {
      case '1':
        return SvgPicture.asset(
          'assets/svgs/rad_1.svg',
          width: 90,
          height: 90,
        );
      case '2':
        return SvgPicture.asset(
          'assets/svgs/rad_2.svg',
          width: 90,
          height: 90,
        );
      case '3':
        return SvgPicture.asset(
          'assets/svgs/rad_3.svg',
          width: 90,
          height: 90,
        );
      case '4':
        return SvgPicture.asset(
          'assets/svgs/rad_4.svg',
          width: 90,
          height: 90,
        );
      case '5':
        return SvgPicture.asset(
          'assets/svgs/rad_5.svg',
          width: 90,
          height: 90,
        );
      case '6':
        return SvgPicture.asset(
          'assets/svgs/rad_6.svg',
          width: 90,
          height: 90,
        );
      case '7':
        return SvgPicture.asset(
          'assets/svgs/rad_7.svg',
          width: 90,
          height: 90,
        );
      case '8':
        return SvgPicture.asset(
          'assets/svgs/rad_8.svg',
          width: 90,
          height: 90,
        );
    }
    setState(() {});
  }

  apertouSwitch() {
    print(switchValue);
  }

  Widget traceRender() {
    int selectedThreadCount = int.parse(selectedThread);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        selectedThreadCount,
        (index) => Text(
          "\'",
          style: TextStyle(
              color: Color(0xff000000),
              fontSize: 11.sp,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 667));
    return SafeArea(
        child: Container(
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFF0A2430),
          Color(0xFF05455E),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            //header
            Header(title: "Inspection P&D [62]", navigator: '/menu'),
            //title
            Align(
                alignment: Alignment.centerLeft,
                child: Categorization(
                    text: "Settings", tamanho: 24, txtalg: TextAlign.left)),
            //sub-titles
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: FontePadrao(
                      text: "Sections",
                      cor: Color(0x8AFFFFFF),
                      tamanho: 10,
                      fw: FontWeight.w400,
                      txtalg: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: FontePadrao(
                      text: "Points per section",
                      cor: Color(0x8AFFFFFF),
                      tamanho: 10,
                      fw: FontWeight.w400,
                      txtalg: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: FontePadrao(
                      text: "Threads por point",
                      cor: Color(0x8AFFFFFF),
                      tamanho: 10,
                      fw: FontWeight.w400,
                      txtalg: TextAlign.center,
                    ),
                  ),
                  Expanded(flex: 3, child: Container())
                ],
              ),
            ),
            //numberpicker/svg`s
            Container(
              height: 230.h,
              // width: double.infinity,
              // color: Colors.black45, //tirar dps
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                        flex: 6,
                        child: Container(
                          // color: Colors.blue,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: NumberPicker(
                                  numberList: sections,
                                  title: "Sections",
                                ),
                              ),
                              Expanded(
                                child: NumberPicker(
                                  numberList: points,
                                  title: "Points per section",
                                ),
                              ),
                              Expanded(
                                child: NumberPicker(
                                  numberList: threads,
                                  title: "Threads per point",
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            // color: Colors.deepOrange,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      // color: Colors.amber,
                                      child: switchSvg(),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            // color: Colors.blue,
                                            child: Stack(children: [
                                              SvgPicture.asset(
                                                'assets/svgs/tire_for_points_sections.svg',
                                                width: 90,
                                                height: 90,
                                              ),
                                              Padding(
                                                padding: selectedPoint == '2'
                                                    ? EdgeInsets.only(
                                                        left: ScreenUtil()
                                                            .setWidth(10),
                                                        right: ScreenUtil()
                                                            .setWidth(6),
                                                        top: ScreenUtil()
                                                            .setHeight(20),
                                                      )
                                                    : EdgeInsets.only(
                                                        left: ScreenUtil()
                                                            .setWidth(13),
                                                        right: ScreenUtil()
                                                            .setWidth(6),
                                                        top: ScreenUtil()
                                                            .setHeight(26),
                                                      ),
                                                child: Column(
                                                  children: [
                                                    selectedThread == 'auto'
                                                        ? Container()
                                                        : traceRender(),
                                                    selectedPoint == '2'
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 15),
                                                            child: selectedThread ==
                                                                    'auto'
                                                                ? Container()
                                                                : traceRender(),
                                                          )
                                                        : Container(),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              // color: Colors.amber,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 15),
                                                          child: Text('1',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                        selectedPoint == '2'
                                                            ? Text('2',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    color: Colors
                                                                        .white))
                                                            : Container(),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 15.h,
                                                    // color: Colors.amberAccent,
                                                  )
                                                ],
                                              ),
                                            )),
                                      ],
                                    )),
                                Expanded(flex: 1, child: Container())
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            //title/switch
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    // color: Colors.amber,
                    child: FontePadrao(
                      text: "Measure frequency and severity",
                      tamanho: 13 * 1.1,
                      fw: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SwitchBudini(
                    value: switchValue,
                    onChanged: (value) {
                      switchValue = value;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            //text
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: FontePadrao(
                text:
                    "The specifications are saved automatically and will be used for the inspections that are started next. \nIf you want to use different settings for another inspection, return to this screen to configure again.",
                tamanho: 11.5,
                fw: FontWeight.w400,
                txtalg: TextAlign.center,
                cor: Color(0x8AFFFFFF),
              ),
            ),
            //container expandido para dar espaçamento
            Expanded(child: Container()),
            //customButtom
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 15, bottom: 8),
              child: FullButtonPadrao(onTap: () {}, text: "Start"),
            ),
          ],
        ),
      ),
    ));
  }
}

class NumberPicker extends StatefulWidget {
  final String title;
  final List<String> numberList;

  NumberPicker({required this.numberList, required this.title});

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 500000.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.title == "Points per section") Expanded(child: SizedBox()),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.numberList.length,
            itemBuilder: (context, index) {
              final itemIndex = index % widget.numberList.length;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Container(
                    width: 40.w,
                    height: 30.h,
                    // color: Colors.black26,
                    child: Expanded(
                      child: Center(
                        child: Text(
                          widget.numberList[itemIndex],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: GoogleFonts.poppins().fontFamily),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (widget.title == "Points per section") Expanded(child: SizedBox()),
      ],
    );
  }
}


// Column(
//       children: [
//         ListView.builder(
//           itemCount: widget.numberList.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//               },
//               child: Container(
//                 padding: EdgeInsets.all(16.0),
//                 color:
//                     index == selectedIndex ? Colors.blue : Colors.transparent,
//                 child: Text(
//                   widget.numberList[index],
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     color: index == selectedIndex ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         Container(
//           padding: EdgeInsets.all(16.0),
//           color: Colors.grey[300],
//           child: Text(
//             'Selected: ${widget.numberList[selectedIndex]}',
//             style: TextStyle(fontSize: 18.0),
//           ),
//         ),
//       ],
//     );
