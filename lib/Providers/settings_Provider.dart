import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String appLanguage = 'en';

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }
}