import 'package:shared_preferences/shared_preferences.dart';

import '../GlobalConstant/PreferencesKeys.dart';
import 'LogTools.dart';

class SharedPreferencesUtil {

  SharedPreferencesUtil._internal();

  factory SharedPreferencesUtil() => _preferences;
  static late final SharedPreferencesUtil _preferences = SharedPreferencesUtil._internal();

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    SharedPreferences.getInstance().then((sp) => sp.setString(key.toString(), value));
  }

  Future<String?> getStringValue(PreferencesKeys key) => SharedPreferences.getInstance().then((sp) => sp.getString(key.toString()));

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    SharedPreferences.getInstance().then((sp) => sp.setBool(key.toString(), value));
  }

  Future<bool> getBoolValue(PreferencesKeys key) => SharedPreferences.getInstance().then((sp) => sp.getBool(key.toString()) ?? false);

  Future<void> remove(PreferencesKeys key) async {
    SharedPreferences.getInstance().then((sp) => sp.remove(key.toString()));
  }

  Future<void> clearAll() async {
    SharedPreferences.getInstance().then((value) => value.clear());
  }
}
