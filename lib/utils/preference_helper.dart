import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  PreferenceHelper._();

  static Future<bool> isLoggedIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("login") ?? false;
  }

  static Future saveLogin(bool value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("login", value);
  }

  /// Clear a storage
  static Future clearStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
