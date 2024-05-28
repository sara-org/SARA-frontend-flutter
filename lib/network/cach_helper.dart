import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }


  static Future<bool?> saveData({
    required String key,
    required dynamic value,
  }) async
  {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }

    return await sharedPreferences.setDouble(key, value);
  }


  static Future<bool?> savetoken({
    required String key,
    required String value,
  }) async
  {
    return await sharedPreferences.setString(key, value);
  }

   static Future<bool?> saveLanguage({
    required String key,
    required String value,
  }) async
  {
    return await sharedPreferences.setString(key, value);
  }

static dynamic getLanguage({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

  static dynamic gettoken({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }


  static Future<bool> removeData({required String key})async
  {
    return await sharedPreferences.remove(key);
  }
}

