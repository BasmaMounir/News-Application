import 'package:flutter/material.dart';

class MyTheme {
  static const Color greenColor = Color(0xff39A552);
  static const Color whiteColor = Color(0xffffffff);
  static ThemeData lightTheme = ThemeData(
      primaryColor: greenColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: greenColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: whiteColor)),
      drawerTheme: const DrawerThemeData(backgroundColor: whiteColor),
      textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 22, color: whiteColor)));
}
