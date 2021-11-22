import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  //One instance, needs factory
  static AppColors? _instance;
  factory AppColors() => _instance ??= AppColors._();

  AppColors._();

  static const primaryColor = Color(0xff53B175);
  static const bgColor = Color(0xFFF6F7F9);
  static const NewprimaryColor = Color(0xFFFF7643);
  static var NewColor = HexToColor("#0f172a");
  static var textInPutBG = HexToColor("#e3ebf2");
  static var textColor = HexToColor("#838C9A");
  static const darkGrey = Color(0xff7C7C7C);
  static const productBG = Color(0xFFAEAEAE);
}
//Convert color from hax color.
class HexToColor extends Color {
  static _hexToColor(String code) {
    return int.parse(code.substring(1, 7), radix: 16) + 0xFF000000;
  }

  HexToColor(final String code) : super(_hexToColor(code));
}
