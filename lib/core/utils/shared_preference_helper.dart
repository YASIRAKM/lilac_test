import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static Future<void> saveValue(
      {required String key, required String value}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  static Future<String?> getValue({required String key}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static Future<void> clearValue({required String key}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
}
