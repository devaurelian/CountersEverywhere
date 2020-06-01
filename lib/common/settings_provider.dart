import 'dart:ui';

import 'package:counters_everywhere/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Helper class that saves and reads app settings to persistent storage.
class SettingsProvider {
  static final String _colorCodeKey = 'color_code';
  static final String _counterKey = 'counter';

  /// Loads the color [value] from persistent storage, or returns a random color value.
  static Future<Color> loadColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(_colorCodeKey)) {
      return Color(prefs.getInt(_colorCodeKey));
    } else {
      final Color color = ColorX.randomMaterialColor();
      await prefs.setInt(_colorCodeKey, color.value);
      return color;
    }
  }

  /// Saves the counter [value] to persistent storage.
  static Future<void> saveCounter(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterKey, value);
  }

  /// Loads the counter [value] from persistent storage.
  static Future<int> loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_counterKey) ?? 0;
  }
}
