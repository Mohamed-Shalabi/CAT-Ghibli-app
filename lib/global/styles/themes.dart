import 'package:flutter/material.dart';
import 'package:state_management_session_two/global/local/prefs.dart';
import 'package:state_management_session_two/global/styles/color_schemes.dart';
import 'package:state_management_session_two/global/styles/text_themes.dart';

class Themes with ChangeNotifier {
  bool get isLight => Prefs.instance.getBool(PrefsKeys.isLightKey) ?? true;

  set isLight(bool value) {
    Prefs.instance.setBool(PrefsKeys.isLightKey, value).then((value) {
      notifyListeners();
    });
  }

  final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorSchemes.lightColorScheme,
    textTheme: TextThemes.getTextTheme(isLight: true),
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorSchemes.darkColorScheme,
    textTheme: TextThemes.getTextTheme(isLight: false),
  );

  void toggleThemeMode() {
    isLight = !isLight;
  }
}

extension ThemeUtils on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;
}
