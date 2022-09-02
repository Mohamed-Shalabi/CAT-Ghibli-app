import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {
  static SharedPreferences? _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _instance!;
}

abstract class PrefsKeys {
  static const String isLightKey = 'is_light';
}
