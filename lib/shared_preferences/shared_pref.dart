import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _preferences;

  SharedPref._internal();

  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences? get instance => _preferences;

  static Future<void> saveInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  static Future<void> saveBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  static Future<void> saveDouble(String key, double value) async {
    await _preferences?.setDouble(key, value);
  }

  static Future<void> saveString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  static Future<void> saveStringList(String key, List<String> value) async {
    await _preferences?.setStringList(key, value);
  }

  static int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  static bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  static double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  static String? getString(String key) {
    return _preferences?.getString(key);
  }

  static List<String>? getStringList(String key) {
    return _preferences?.getStringList(key);
  }

  static Future<void> clear() async {
    await _preferences?.clear();
  }

  static Future<bool?> getBoolFuture(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key); // Returns a Future<bool?>
  }

  static Future<void> setBoolFuture(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value); // Save the boolean value
  }
}
