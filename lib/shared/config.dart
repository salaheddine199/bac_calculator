// set constatns config here:

import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  // screen width and height initialization:
  static void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

// getters for our height and width variables:
  static get widthSize => screenWidth;
  static get heightSize => screenHeight;

  // define spacing height:
  static const spaceSmall = SizedBox(height: 25);
  static final spaceMedium = SizedBox(height: screenHeight! * 0.05);
  static final spaceBig = SizedBox(height: screenHeight! * 0.08);

  //textform field border:
  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.greenAccent,
    ),
  );
  static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.red,
    ),
  );
  static const primaryColor = Colors.greenAccent;
}
