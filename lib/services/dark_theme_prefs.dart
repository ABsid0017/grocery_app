import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs {
  static const Theme_status = "Theme_status";
  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Theme_status, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Theme_status) ?? false;
  }
}
