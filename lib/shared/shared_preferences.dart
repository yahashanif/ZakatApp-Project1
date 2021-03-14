part of 'shared.dart';

class SharedPreferencesHelper {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String _kLanguageCode = "language";
  static final String _kEmasPrice = "emas";
  static final String _kPerakPrice = "perak";

  /// ------------------------------------------------------------
  /// Method that returns the user language code, 'en' if not set
  /// ------------------------------------------------------------
  static Future<String> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kLanguageCode) ?? 'Indonesia';
  }

  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------
  static Future<bool> setLanguageCode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kLanguageCode, value);
  }

  static Future<int> getEmasPrice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_kEmasPrice) ?? 0;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------
  static Future<bool> setEmasPrice(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt(_kEmasPrice, value);
  }

  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------
  static Future<bool> setPerakPrice(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt(_kPerakPrice, value);
  }

  static Future<int> getPerakPrice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_kPerakPrice) ?? 0;
  }
}
