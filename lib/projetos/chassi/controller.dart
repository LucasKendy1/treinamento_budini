import 'package:flutter/material.dart';

class ChassisController extends StatefulWidget {
  const ChassisController({super.key});

  @override
  State<ChassisController> createState() => _ChassisControllerState();
}

class _ChassisControllerState extends State<ChassisController> {
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
    return const Placeholder();
  }
}
