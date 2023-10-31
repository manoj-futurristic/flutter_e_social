import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  ThemeData _themeData = ThemeData.dark();

  get isDarkMode => _isDarkMode;
  get themeData => _themeData;
  

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    if (_isDarkMode) {
      _themeData = ThemeData.light();
    } else {
      _themeData = ThemeData.dark();
    }
  }
}
