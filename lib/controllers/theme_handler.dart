import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeHandler with ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _prefs;
  bool? _darkTheme;

  bool? get darkTheme => _darkTheme;

  ThemeHandler() {
    _darkTheme = false;
    _loadFromPrefs();
  }

  toggleTheme(BuildContext ctx) {
    _darkTheme = !_darkTheme!;
    _saveToPrefs();
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: _darkTheme == false
            ? Text('Mukwa Theme selected, Enjoy')
            : Text('Sky Theme selected, Enjoy')));
    notifyListeners();
  }

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs?.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs?.setBool(key, _darkTheme!);
  }
}
