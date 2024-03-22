import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_evertec/app/core/config/config.dart';

class Preferences {
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool get sesionActive => _prefs.getBool('sesionActive') ?? false;
  set sesionActive(bool value) => _prefs.setBool('sesionActive', value);

  bool get isDarkMode => _prefs.getBool('isDarkMode') ?? false;
  set isDarkMode(bool value) => _prefs.setBool('isDarkMode', value);

  Future<void> clear() async {
    try {
      await _prefs.clear();
    } catch (e) {
      AppConfig.logError(e);
    }
  }
}
