// ignore_for_file: unreachable_switch_default

import 'package:flutter/material.dart';
import 'themes.dart';

enum AppTheme {
  Light,
  Dark,
  Blue,
  Elegant,
}

class ThemeProvider extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.Light;

  ThemeData getThemeData() {
    switch (_currentTheme) {
      case AppTheme.Dark:
        return darkTheme;
      case AppTheme.Blue:
        return blueTheme;
      case AppTheme.Elegant:
        return elegantTheme;
      case AppTheme.Light:
      default:
        return lightTheme;
    }
  }

  AppTheme get currentTheme => _currentTheme;

  void switchTheme(AppTheme theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}
