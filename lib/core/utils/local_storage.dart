import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class LocalStorage {
  late SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setString({required String key, required String value}) {
    _prefs.setString(key, value);
  }

  void setBool({required String key, required bool value}) {
    _prefs.setBool(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }
}
