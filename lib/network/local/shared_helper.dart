import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

// Save Data

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    return await sharedPreferences!.setDouble(key, value);
  }

  //   static Future<bool?> saveData({
  //   required bool value,
  //   required String key,
  // }) async {
  //    return await sharedPreferences?.setBool(key, value);
  // }

// Get Data

  // static bool? getData({
  //   required String key,
  // })  {
  //   return sharedPreferences!.getBool(key);
  // }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences?.get(key);
  }

// Remove Data

  static Future<bool>? removeData({
    required key,
  }) async {
    return await sharedPreferences!.remove(key);
  }
}
