// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treinamento/components/button_switch.dart';
import 'package:treinamento/components/clockwise_button.dart';
import 'package:treinamento/components/default_button.dart';
import 'package:treinamento/components/fonte_padrao.dart';
import 'package:treinamento/components/header.dart';
import 'package:treinamento/components/number_dot.dart';
import 'package:treinamento/components/switch.dart';

class Chassi extends StatefulWidget {
  const Chassi({super.key});

  @override
  State<Chassi> createState() => _ChassiState();
}

class _ChassiState extends State<Chassi> {
  bool switchState = false;

  // ChassisController chController = ChassisController();

  bool clockwise = true;

  bool front = true;
  bool left = true;

  bool frontLeft = true;
  bool frontRight = false;
  bool rearLeft = false;
  bool rearRight = false;

  int frontLeftValue = 1;
  int frontRightValue = 2;
  int rearLeftValue = 3;
  int rearRightValue = 4;

  atualizaClockWise() {
    if (clockwise) {
      apertouClockwise();
    } else {
      apertouCounterClockwise();
    }
  }

  apertouFront() {
    if (front == false) {
      front = !front;
    }
    if (left) {
      //front left
      frontLeft = true;
      frontRight = false;
      rearLeft = false;
      rearRight = false;
    } else {
      //front right
      frontLeft = false;
      frontRight = true;
      rearLeft = false;
      rearRight = false;

      // left = false;
    }
    atualizaClockWise();
    setState(() {});
  }

  apertouRear() {
    if (front == true) {
      front = !front;
    }

    if (left) {
      //rear left
      frontLeft = false;
      frontRight = false;
      rearLeft = true;
      rearRight = false;
    } else {
      //rear right
      frontLeft = false;
      frontRight = false;
      rearLeft = false;
      rearRight = true;

      // left = !left;
    }
    atualizaClockWise();
    setState(() {});
  }

  apertouLeft() {
    if (left == false) {
      left = !left;
    }

    if (front) {
      //left front
      frontLeft = true;
      frontRight = false;
      rearLeft = false;
      rearRight = false;
    } else {
      //left rear
      frontLeft = false;
      frontRight = false;
      rearLeft = true;
      rearRight = false;

      // left = !left;
    }
    atualizaClockWise();
    setState(() {});
  }

  apertouRight() {
    if (left == true) {
      left = !left;
    }

    if (front) {
      //right front
      frontLeft = false;
      frontRight = true;
      rearLeft = false;
      rearRight = false;
    } else {
      //rught rear
      frontLeft = false;
      frontRight = false;
      rearLeft = false;
      rearRight = true;

      // left = !left;
    }
    atualizaClockWise();
    setState(() {});
  }

  apertouFrontLeft() {
    left = true;
    front = true;

    frontLeft = true;
    frontRight = false;
    rearLeft = false;
    rearRight = false;

    frontLeftValue = 1;
    if (clockwise) {
      frontRightValue = 2;
      rearRightValue = 3;
      rearLeftValue = 4;
    } else {
      frontRightValue = 4;
      rearRightValue = 3;
      rearLeftValue = 2;
    }

    setState(() {});
  }

  apertouFrontRight() {
    left = false;
    front = true;

    frontLeft = false;
    frontRight = true;
    rearLeft = false;
    rearRight = false;

    frontRightValue = 1;
    if (clockwise) {
      frontLeftValue = 4;
      rearRightValue = 2;
      rearLeftValue = 3;
    } else {
      frontLeftValue = 2;
      rearRightValue = 4;
      rearLeftValue = 3;
    }

    setState(() {});
  }

  apertouRearLeft() {
    left = true;
    front = false;

    frontLeft = false;
    frontRight = false;
    rearLeft = true;
    rearRight = false;

    rearLeftValue = 1;

    if (clockwise) {
      frontLeftValue = 2;
      frontRightValue = 3;
      rearRightValue = 4;
    } else {
      frontLeftValue = 4;
      rearRightValue = 2;
      frontRightValue = 3;
    }

    setState(() {});
  }

  apertouRearRight() {
    left = false;
    front = false;

    frontLeft = false;
    frontRight = false;
    rearLeft = false;
    rearRight = true;

    rearRightValue = 1;
    if (clockwise) {
      frontLeftValue = 3;
      frontRightValue = 4;
      rearLeftValue = 2;
    } else {
      frontLeftValue = 3;
      frontRightValue = 2;
      rearLeftValue = 4;
    }

    setState(() {});
  }

  apertouClockwise() {
    if (clockwise == false) {
      clockwise = !clockwise;
    }

    if (frontLeft) {
      apertouFrontLeft();
    } else if (frontRight) {
      apertouFrontRight();
    } else if (rearLeft) {
      apertouRearLeft();
    } else {
      apertouRearRight();
    }

    setState(() {});
  }

  apertouCounterClockwise() {
    if (clockwise == true) {
      clockwise = !clockwise;
    }

    if (frontLeft) {
      apertouFrontLeft();
    } else if (frontRight) {
      apertouFrontRight();
    } else if (rearLeft) {
      apertouRearLeft();
    } else {
      apertouRearRight();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                Header(title: "Inspection sequence", navigator: "/menu"),
                Container(
                  //background
                  decoration: BoxDecoration(
                    color: Color(0xff0A2430),
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FontePadrao(
                            text: "Change inspection sequence",
                            cor: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: SwitchBudini(
                              value: switchState,
                              onChanged: (value) {
                                switchState = value;
                                print(switchState);
                                setState(() {});
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    if (switchState == true)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FontePadrao(
                            text:
                                "To determine an inspection standard, select the starting position and rotation on the model vehicle.",
                            tamanho: 13,
                            txtalg: TextAlign.center,
                          ),

                          Container(
                            child: wheelsAxis(),
                          ),

                          //Rotation
                          Container(
                            child: rotation(),
                          ),
                        ],
                      ),
                  ],
                ),
                //aplly
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: FullButtonPadrao(
                    onTap: () {
                      print(
                          "Clockwise: $clockwise, Front: $front, Left: $left, Right: ${!left}, Rear: ${!front}, FrontLeftValue: $frontLeftValue, FrontRightValue: $frontRightValue, RearLeftValue: $rearLeftValue, RearRightValue: $rearRightValue");
                    },
                    text: "Apply",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  frontWheels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        wheel(),
        Expanded(
          child: axis(true),
        ),
        wheel(),
      ],
    );
  }

  rearWheels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        wheel(),
        Expanded(
          child: axis2(),
        ),
        wheel(),
      ],
    );
  }

  axis2() {
    return Container(
      height: 1.h,
      color: Colors.white,
    );
  }

  axis(bool iconEnable) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset('assets/images/volante.png'),
        ),
        Container(
          height: 1.h,
          color: Colors.white,
        ),
      ],
    );
  }

  wheel() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // numberDot(controller.bottomLeft, controller.leftFrontValue),
        Container(
          height: 48.h,
          width: 24.w,
          decoration: BoxDecoration(
            color: Color(0x3DFFFFFF),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Color(0xFFFFFFFF)),
          ),
        ),
      ],
    );
  }

  wheelsAxis() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
          height: 300.h,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  // color: Colors.blue,
                  width: 100.w,
                  child: Center(
                    child: ButtonSwitch(
                      text: "Front",
                      isToggled: front,
                      onTapCallBack: apertouFront,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  // color: Colors.amberAccent,
                  width: 150.w,
                  child: Stack(
                    children: [
                      Center(
                        child: frontWheels(),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: NumberDot(
                              active: frontLeft,
                              number: frontLeftValue,
                              onTap: apertouFrontLeft,
                            ),
                          ),
                          Expanded(
                              flex: 9,
                              child: Container(
                                  // color: Colors.blue,
                                  )),
                          Expanded(
                              flex: 2,
                              child: NumberDot(
                                active: frontRight,
                                number: frontRightValue,
                                onTap: apertouFrontRight,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      // color: Colors.deepOrange,
                      width: 100.w,
                      child: Center(
                        child: ButtonSwitch(
                          text: "Left",
                          isToggled: left,
                          onTapCallBack: apertouLeft,
                        ),
                      ),
                    ),
                    SizedBox(
                      // color: Colors.deepOrange,
                      width: 100.w,
                      child: Center(
                        child: ButtonSwitch(
                          text: "Right",
                          isToggled: !left,
                          onTapCallBack: apertouRight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  // color: Colors.amberAccent,
                  width: 150.w,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          child: rearWheels(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.zero,
                              // color: Colors.brown,
                              child: NumberDot(
                                  active: rearLeft,
                                  number: rearLeftValue,
                                  onTap: apertouRearLeft),
                            ),
                          ),
                          Expanded(
                              flex: 9,
                              child: Container(
                                  // color: Colors.blue,
                                  )),
                          Expanded(
                              flex: 2,
                              child: NumberDot(
                                  active: rearRight,
                                  number: rearRightValue,
                                  onTap: apertouRearRight))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  // color: Colors.blue,
                  width: 100.w,
                  child: Center(
                    child: ButtonSwitch(
                      text: "Rear",
                      isToggled: !front,
                      onTapCallBack: apertouRear,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  rotation() {
    return Container(
      // color: Colors.brown,
      height: 40.h,
      width: 200.w,
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                // color: Colors.amberAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          // color: Colors.green,
                          child: Text(
                            "Rotation",
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          // color: Colors.blue,
                          child: Text(
                            clockwise ? "Clockwise" : "Counter-clockwise",
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        )),
                  ],
                ),
              )),
          Expanded(
            child: ClockWiseButton(
                clockwise: clockwise,
                imagePath: 'assets/images/counter_clockwise.png',
                topLeft: 5,
                bottomLeft: 5,
                bottomRight: 0,
                topRight: 0,
                onTapCallBack: apertouClockwise),
          ),
          Expanded(
            child: ClockWiseButton(
                clockwise: !clockwise,
                imagePath: 'assets/images/clockwise.png',
                topLeft: 0,
                bottomLeft: 0,
                bottomRight: 5,
                topRight: 5,
                onTapCallBack: apertouCounterClockwise),
          ),
        ],
      ),
    );
  }
}
