import 'package:flutter/material.dart';
import 'package:state_management_session_two/global/styles/color_schemes.dart';

abstract class TextThemes {
  static TextTheme getTextTheme({required bool isLight}) {
    final colorScheme =
        isLight ? ColorSchemes.lightColorScheme : ColorSchemes.darkColorScheme;

    return TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: colorScheme.onBackground,
      ),
      titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: colorScheme.onBackground,
      ),
    );
  }
}
