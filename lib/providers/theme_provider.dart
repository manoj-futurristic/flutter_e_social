import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  ThemeData _themeData = ThemeData.dark(useMaterial3: true);

  get isDarkMode => _isDarkMode;
  get themeData => _themeData;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    if (_isDarkMode) {
      _themeData = ThemeData.light(useMaterial3: true);
    } else {
      _themeData = ThemeData.dark(useMaterial3: true);
    }
  }
}
