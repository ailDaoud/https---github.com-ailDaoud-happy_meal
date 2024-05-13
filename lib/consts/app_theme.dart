import 'package:flutter/material.dart';

class Style {
  static ThemeData themeData(bool isdark, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: isdark ? Colors.black : Colors.white,
        primaryColor: Colors.blueAccent,
        colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isdark ? Colors.grey : Colors.greenAccent,
            brightness: isdark ? Brightness.dark : Brightness.light),
        cardColor: isdark ? Colors.black26 : Colors.greenAccent,
        canvasColor: isdark ? Colors.black26 : Colors.greenAccent,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme:
                isdark ? const ColorScheme.dark() : const ColorScheme.light()));
  }
}
