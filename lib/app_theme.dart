import 'package:flutter/material.dart';

class AppTheme {
   static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.indigo,
    backgroundColor: Colors.grey,
  );

   static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.orange,
      backgroundColor: Colors.white,
  );
}