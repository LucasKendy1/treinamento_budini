// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:treinamento/components/default_button.dart';
import 'package:treinamento/components/fonte_padrao.dart';
import 'package:treinamento/components/fronte_categorizacao.dart';
import 'package:treinamento/components/header.dart';
import 'package:treinamento/components/switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treinamento/main.dart';
import 'package:numberpicker/numberpicker.dart';
// import 'package:treinamento/projetos/inspection/number_picker.dart';
// import 'package:treinamento/projetos/inspection/number_picker.dart';
// import 'package:treinamento/projetos/inspection/number_picker_v2.dart';

class Inspection extends StatefulWidget {
  const Inspection({super.key});

  @override
  State<Inspection> createState() => _InspectionState();
}

class _InspectionState extends State<Inspection> {
  bool switchValue = false;

  List<int> sections = [1, 2, 3, 4, 5, 6, 7, 8];
  List<int> points = [1, 2];
  List<int> threads = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // late String selectedSection;
  // late String selectedPoint;
  // late String selectedThread;

  // late NumberPicker2 npSections;
  // late NumberPicker2 npPoint;
  // late NumberPicker2 npThread;

  int selectedSection = 2;
  int selectedPoint = 2;
  int selectedThread = 2;

  switchSvg() {
    selectedSection = selectedSection;
    return SvgPicture.asset(
      'assets/svgs/rad_$selectedSection.svg',
      width: 90,
      height: 90,
    );
    setState(() {});
    // switch (selectedSection) {
    //   case 1:
    //     return SvgPicture.asset(
    //       'assets/svgs/rad_1.svg',
    //       width: 90,
    //       height: 90,
    //     );
    //   case 2:
    //     return SvgPicture.asset(
    //       'assets/svgs/rad_2.svg',
    //       width: 90,
    //       height: 90,
    //     );
    //   case 3:
    //     return SvgPicture.asset(
    //       'assets/svgs/rad_3.svg',
    //       width: 90,
    //       height: 90,
    //     );
    //   case 4:
    //     return SvgPicture.asset(
    //       'assets/svgs/rad_4.svg',
    //       width: 90,
    //       height: 90,
    //     );
    //   case 5:
    //     return SvgPicture.asset(
    //       'assets/svgs/rad_5.svg',
    //       width: 90,
    //       height: 90,
    //     );
    //   case 6:
    //     return SvgPicture.asset(
    //       'assets/svgs/rad_6.svg',
    //       width: 90,
    //       height: 90,
    //     );
    //   case 7:
    //     return SvgPicture.asset(
    //       'assets/svgs/rad_7.svg',
    //       width: 90,
    //       height: 90,
    //     );
    //   case 8:
    //     return SvgPicture.asset(
    //       'assets/svgs/rad_8.svg',
    //       width: 90,
    //       height: 90,
    //     );
    // }
    
  }

  apertouSwitch() {
    print(switchValue);
  }

  Widget traceRender() {
    if (selectedThread != 9) {
      int selectedThreadCount = selectedThread;

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          selectedThreadCount,
          (index) => Text(
            "\'",
            style: TextStyle(
                color: Color(0xff000000),
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  initState() {
    super.initState();
  }

  String modifyText(String s) {
    if (s == '9')
      return "auto";
    else
      return "" + s;
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
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
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
            ),
            //numberpicker/svg`s
            Container(
              height: 275.h,
              // width: double.infinity,
              // color: Colors.black45, //tirar dps
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                        flex: 6,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0x3DFFFFFF),
                                        ),
                                        width: 50.w,
                                        height: 45.h,
                                      ),
                                    ),
                                    NumberPicker(
                                      haptics: true,
                                      selectedTextStyle: TextStyle(
                                        color: Color(0xff27F3ED),
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 20.sp,
                                      ),
                                      itemHeight: 50.h,
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 15.sp,
                                      ),
                                      itemWidth: 50.w,
                                      infiniteLoop: true,
                                      value: selectedSection,
                                      minValue: 1,
                                      maxValue: 8,
                                      onChanged: (value) => setState(
                                          () => selectedSection = value),
                                      itemCount: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 80),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (selectedSection == 1) {
                                              selectedSection = 8;
                                            } else {
                                              selectedSection =
                                                  selectedSection - 1;
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 80),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            selectedSection =
                                                selectedSection + 1;
                                            if (selectedSection > 8) {
                                              selectedSection =
                                                  selectedSection % 8;
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                    //padding maior
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (selectedSection == 2 ||
                                                selectedSection == 1) {
                                              switch (selectedSection) {
                                                case 2:
                                                  selectedSection = 8;
                                                case 1:
                                                  selectedSection = 7;
                                              }
                                            } else {
                                              selectedSection =
                                                  selectedSection - 2;
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            selectedSection =
                                                selectedSection + 2;
                                            if (selectedSection > 8) {
                                              selectedSection =
                                                  selectedSection % 8;
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0x3DFFFFFF),
                                        ),
                                        width: 50.w,
                                        height: 45.h,
                                      ),
                                    ),
                                    NumberPicker(
                                      selectedTextStyle: TextStyle(
                                        color: Color(0xff27F3ED),
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 19.sp,
                                      ),
                                      itemHeight: 50.h,
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 15.sp,
                                      ),
                                      itemWidth: 50.w,
                                      infiniteLoop: true,
                                      value: selectedPoint,
                                      minValue: 1,
                                      maxValue: 2,
                                      onChanged: (value) =>
                                          setState(() => selectedPoint = value),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 80),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (selectedPoint == 1) {
                                              selectedPoint = 2;
                                            } else {
                                              selectedPoint = 1;
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 80),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (selectedPoint == 1) {
                                              selectedPoint = 2;
                                            } else {
                                              selectedPoint = 1;
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0x3DFFFFFF),
                                        ),
                                        width: 50.w,
                                        height: 45.h,
                                      ),
                                    ),
                                    NumberPicker(
                                      textMapper: modifyText,
                                      selectedTextStyle: TextStyle(
                                        color: Color(0xff27F3ED),
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 19.sp,
                                      ),
                                      itemHeight: 50.h,
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 15.sp,
                                      ),
                                      itemWidth: 50.w,
                                      infiniteLoop: true,
                                      value: selectedThread,
                                      minValue: 1,
                                      maxValue: 9,
                                      itemCount: 5,
                                      onChanged: (value) => setState(
                                          () => selectedThread = value),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 80),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (selectedThread == 1) {
                                              selectedThread = 9;
                                            } else {
                                              selectedThread =
                                                  selectedThread - 1;
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 80),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            selectedThread = selectedThread + 1;
                                            if (selectedThread > 9) {
                                              selectedThread =
                                                  selectedThread % 9;
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (selectedThread == 2 ||
                                                selectedThread == 1) {
                                              switch (selectedThread) {
                                                case 2:
                                                  selectedThread = 9;
                                                case 1:
                                                  selectedThread = 8;
                                              }
                                            } else {
                                              selectedThread =
                                                  selectedThread - 2;
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (selectedThread == 7 ||
                                                selectedThread == 8 ||
                                                selectedThread == 9) {
                                              switch (selectedThread) {
                                                case 7:
                                                  selectedThread = 9;
                                                case 8:
                                                  selectedThread = 1;
                                                case 9:
                                                  selectedThread = 2;
                                              }
                                            } else {
                                              selectedThread =
                                                  selectedThread + 2;
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 30.w,
                                            height: 30.h,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                                    child: ValueListenableBuilder(
                                        valueListenable: atualizaNp,
                                        builder: (context, snapshot, _) {
                                          return Container(
                                            child: switchSvg(),
                                          );
                                        })),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: ValueListenableBuilder(
                                              valueListenable: atualizaNp,
                                              builder: (context, snapshot, _) {
                                                selectedPoint = selectedPoint;
                                                return Container(
                                                  // color: Colors.blue,
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/svgs/tire_for_points_sections.svg',
                                                          width: 90,
                                                          height: 90,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                selectedPoint ==
                                                                        2
                                                                    ? EdgeInsets
                                                                        .only(
                                                                        left: ScreenUtil()
                                                                            .setWidth(10),
                                                                        right: ScreenUtil()
                                                                            .setWidth(6),
                                                                        top: ScreenUtil()
                                                                            .setHeight(30),
                                                                      )
                                                                    : EdgeInsets
                                                                        .only(
                                                                        left: ScreenUtil()
                                                                            .setWidth(13),
                                                                        right: ScreenUtil()
                                                                            .setWidth(6),
                                                                        top: ScreenUtil()
                                                                            .setHeight(40),
                                                                      ),
                                                            child: Column(
                                                              children: [
                                                                traceRender(),
                                                                selectedPoint ==
                                                                        2
                                                                    ? Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                20),
                                                                        child:
                                                                            traceRender(),
                                                                      )
                                                                    : Container(),
                                                              ],
                                                            )),
                                                      ]),
                                                );
                                              }),
                                        ),
                                        ValueListenableBuilder(
                                            valueListenable: atualizaNp,
                                            builder: (context, snapshot, _) {
                                              selectedPoint = selectedPoint;
                                              return Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    // color: Colors.amber,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
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
                                                                        right:
                                                                            15),
                                                                child: Text('1',
                                                                    style: TextStyle(
                                                                        fontSize: 13
                                                                            .sp,
                                                                        color: Colors
                                                                            .white)),
                                                              ),
                                                              selectedPoint == 2
                                                                  ? Text('2',
                                                                      style: TextStyle(
                                                                          fontSize: 13
                                                                              .sp,
                                                                          color:
                                                                              Colors.white))
                                                                  : Container(),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 5.h,
                                                          // color: Colors
                                                          //     .amberAccent,
                                                        )
                                                      ],
                                                    ),
                                                  ));
                                            }),
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
                Container(
                  // color: Colors.amber,
                  child: FontePadrao(
                    text: "Measure frequency and severity",
                    tamanho: 13 * 1.1,
                    fw: FontWeight.w600,
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
              padding: const EdgeInsets.only(bottom: 0),
              child: Text(
                "The specifications are saved automatically and will be used for the inspections that are started next. \nIf you want to use different settings for another inspection, return to this screen to configure again.",
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0x8AFFFFFF),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            //container expandido para dar espaçamento
            Expanded(child: Container()),
            //customButtom
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 15, bottom: 8),
              child: FullButtonPadrao(
                  onTap: () {
                    Navigator.pushNamed(context, '/menu');
                  },
                  text: "Start"),
            ),
          ],
        ),
      ),
    ));
  }
}
