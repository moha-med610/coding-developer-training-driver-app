import 'package:shared_preferences/shared_preferences.dart';

/// usage
/// await SharedPrefService().saveString("key", "value");
/// SharedPrefService().getString("key");
/// await SharedPrefService().remove("key");
/// await SharedPrefService().clear();
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static final SharedPrefService _instance = SharedPrefService._internal();

  factory SharedPrefService() {
    return _instance;
  }
  SharedPrefService._internal();

  late SharedPreferences _prefs;

  // init shared preferences to use in main function
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // save data
  Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<void> saveBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  Future<void> saveInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  Future<void> saveDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  Future<void> saveStringList(String key, List<String> value) async {
    await _prefs.setStringList(key, value);
  }

  // get data

  String? getString(String key) {
    return _prefs.getString(key);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  // remove data with key
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  // clear all data
  Future<void> clear() async {
    await _prefs.clear();
  }
}
