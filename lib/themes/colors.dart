import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor primarySwatch = buildMaterialColor(darkBrown);
  static const Color darkBrown = Color(0xFF492F24);
  static const Color medBrown = Color(0xffAE957B);
  static const Color lightBrown = Color(0xFFFFE3C5);
  static const Color darkSilver = Color(0xFFB6B6B6);
  static const Color lightSilver = Color(0xffC9C9C9);
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}