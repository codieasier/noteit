import 'package:flutter/material.dart';
//light
ThemeData lightmode=ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(surface: Colors.grey.shade300,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade600,
      inversePrimary: Colors.grey.shade800),


);

//dark mode

ThemeData darkmode=ThemeData(
brightness: Brightness.dark,
colorScheme: ColorScheme.dark(surface: Colors.grey.shade900,
primary: Colors.grey.shade800,
secondary: Colors.grey.shade600,
inversePrimary: Colors.grey.shade500),);
