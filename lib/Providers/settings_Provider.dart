import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currantLanguage = 'en';

  void changeLanguage(String newLanguage) {
    currantLanguage = newLanguage;
    notifyListeners();
  }
}
