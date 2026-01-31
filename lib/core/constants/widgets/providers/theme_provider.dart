import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  void SwitchTheme(bool value) {
    isDark = value;
    notifyListeners();
  }
}
