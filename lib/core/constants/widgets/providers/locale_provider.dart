import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('en'); // default lang.

  //getter.
  Locale get locale => _locale;

  //function that changes the lang.
  void setLocale(Locale locale) {
    //switch the old lang with new lang.
    _locale = locale;

    //the local changes,do rebuild------>>to all widgets that listen.
    notifyListeners();
  }
}
