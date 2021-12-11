import 'dart:ui';

import 'package:flutter/material.dart';

class LightTheme{
  static Color mainColor = Color(0xffE2EBFF);
  static Color textColor = Colors.black;
  static Image backGround = AssetImage('assets/fone1.png') as Image;
  static List<Color> gradient = [Color(0xffCDDAF5),Color(0xff9CBCFF)];
  static Color iconsColor = Color(0xff5A5A5A);
}

class DarkTheme{
  static Color mainColor = Color(0xff0C172B);
  static Color textColor = Colors.white;
  static Image backGround = AssetImage('assets/fone2.png') as Image;
  static List<Color> gradient = [Color(0xff223B70),Color(0xff0F1F40)];
  static Color iconsColor = Color(0xffD2D2D2);
}