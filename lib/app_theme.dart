import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final Color mainColor =
      ThemeMode.system == ThemeMode.dark ? Colors.blueGrey : Colors.orange;

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(color: Colors.orange),
    bottomAppBarColor: Colors.orange,
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: Colors.orange),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.orange,
      textTheme: ButtonTextTheme.primary,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: Colors.orange,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.orange,
      unselectedLabelColor: Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.orange,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.orange),
      errorStyle: TextStyle(color: Colors.orange),
      errorMaxLines: 3,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    primaryColor: Colors.orange,
    backgroundColor: Colors.white,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(color: Colors.blueGrey),
    bottomAppBarColor: Colors.blueGrey,
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: Colors.blueGrey),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueGrey,
      textTheme: ButtonTextTheme.primary,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: Colors.blueGrey,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.blueGrey,
      unselectedLabelColor: Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.blueGrey,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.blueGrey),
      errorStyle: TextStyle(color: Colors.blueGrey),
      errorMaxLines: 3,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    primaryColor: Colors.blueGrey,
    backgroundColor: Colors.white,
  );
}
