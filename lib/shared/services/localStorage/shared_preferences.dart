import 'package:allocation_front/shared/errors/app_errors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ilocal_storage.dart';

class SharedPreferencesImpl implements ILocalStorage {
  @override
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Future<T> getItem<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.get(key) as T;
  }

  @override
  Future<void> insert<R>(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw ErrorMessage(message: "this type is not exist in this storage");
    }
  }
}
