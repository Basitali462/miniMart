import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();

  //colors
  static final fruitBgColor = Color(0xFFe5f4d1);
  static final veggieBgColor = Color(0xFFbaf4e8);
  static final dairyBgColor = Color(0xFFffefc9);
  static final meatBgColor = Color(0xFFffd6d7);
  static final selectedContainerColor = Color(0xFFff7e82);

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
  );
}