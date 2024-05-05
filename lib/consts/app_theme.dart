import 'package:flutter/material.dart';

final apptheme=ThemeData(
colorScheme: GlobalThemData.darkColorScheme,
      canvasColor: Color.fromARGB(255, 241, 244, 81),
      scaffoldBackgroundColor: GlobalThemData.lightColorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: Color.fromARGB(255, 16, 220, 220)
);
class GlobalThemData {
static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    onPrimary: Colors.black,
    secondary: Color(0xFFEFF3F3),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Colors.white,
    background: Color.fromARGB(239, 202, 209, 154),
    onBackground: Colors.white,
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    secondary: Color(0xFF4D1F7C),
    background: Color(0xFF241E30),
    surface: Color.fromARGB(255, 158, 116, 226),
    onBackground: Color(0x0DFFFFFF),
    error: Colors.redAccent,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}