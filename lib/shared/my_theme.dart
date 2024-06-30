import 'package:bac_calculator/shared/config.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  // pre-define input decoration:
  inputDecorationTheme: const InputDecorationTheme(
    focusColor: Config.primaryColor,
    border: Config.outlinedBorder,
    enabledBorder: Config.outlinedBorder,
    focusedBorder: Config.focusBorder,
    errorBorder: Config.errorBorder,
    floatingLabelStyle: TextStyle(color: Config.primaryColor),
    prefixIconColor: Colors.black38,
  ),
  // scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Config.primaryColor,
    selectedItemColor: Colors.white,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    unselectedItemColor: Colors.grey.shade700,
    elevation: 10,
    type: BottomNavigationBarType.fixed,
  ),
);
