import 'package:shared_preferences/shared_preferences.dart';

/// usage
/// await SharedPrefService.saveString("key", "value");
/// SharedPrefService.getString("key");
/// await SharedPrefService.remove("key");
/// await SharedPrefService.clear();
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static SharedPreferences? _prefs;

  // init shared preferences to use in main function
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // save data
  static Future<void> saveString(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  static Future<void> saveBool(String key, bool value) async {
    await _prefs!.setBool(key, value);
  }

  static Future<void> saveInt(String key, int value) async {
    await _prefs!.setInt(key, value);
  }

  static Future<void> saveDouble(String key, double value) async {
    await _prefs!.setDouble(key, value);
  }

  static Future<void> saveStringList(String key, List<String> value) async {
    await _prefs!.setStringList(key, value);
  }

  // get data
  static String? getString(String key) {
    return _prefs!.getString(key);
  }

  static bool? getBool(String key) {
    return _prefs!.getBool(key);
  }

  static int? getInt(String key) {
    return _prefs!.getInt(key);
  }

  static double? getDouble(String key) {
    return _prefs!.getDouble(key);
  }

  static List<String>? getStringList(String key) {
    return _prefs!.getStringList(key);
  }

  // remove data with key
  static Future<void> remove(String key) async {
    await _prefs!.remove(key);
  }

  // clear all data
  static Future<void> clear() async {
    await _prefs!.clear();
  }
}
