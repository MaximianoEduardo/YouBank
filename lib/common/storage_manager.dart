import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static void saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    switch (value) {
      case int:
        prefs.setInt(key, value);
        break;
      case String:
        prefs.setString(key, value);
        break;
      case bool:
        prefs.setBool(key, value);
        break;
      default:
    }
  }

  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();

    dynamic obj = prefs.get(key);

    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
