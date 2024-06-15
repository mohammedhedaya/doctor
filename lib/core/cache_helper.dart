
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Initialize the cache
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! Get a String value from the cache
  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! Save data in the cache using a key
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  //! Get data already saved in the cache
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! Remove data using a specific key
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! Check if the cache contains a specific key
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  //! Clear all data in the cache
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  //! Save data in the cache using a key
  Future<dynamic> put({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

  //! Check if the user is logged in
  bool isLoggedIn() {
    return sharedPreferences.getBool('isLoggedIn') ?? false;
  }
}
