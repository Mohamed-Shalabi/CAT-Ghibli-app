import 'package:flutter/material.dart';

abstract class ColorSchemes {
  static ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Colors.cyan.shade900,
    onPrimary: Colors.white,
    secondary: Colors.cyan.shade600,
    onSecondary: Colors.black,
    error: Colors.red.shade900,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.grey.shade300,
    onSurface: Colors.black,
    surfaceVariant: Colors.grey.shade400,
    onSurfaceVariant: Colors.black,
  );

  static ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.cyan.shade900,
    onPrimary: Colors.white,
    secondary: Colors.blue.shade900,
    onSecondary: Colors.white,
    error: Colors.red.shade900,
    onError: Colors.white,
    background: Colors.grey.shade900,
    onBackground: Colors.white,
    surface: Colors.grey.shade700,
    onSurface: Colors.white,
    surfaceVariant: Colors.grey.shade900,
    onSurfaceVariant: Colors.white,
  );
}
