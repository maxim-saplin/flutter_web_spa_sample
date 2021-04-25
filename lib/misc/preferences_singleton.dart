import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesSingleton {
  static SharedPreferences? _sp;

  static SharedPreferences get instance => _sp!;

  static Future<void> init([SharedPreferences? mockInstance]) async {
    if (mockInstance != null) {
      _sp = mockInstance;
    } else {
      WidgetsFlutterBinding.ensureInitialized();
      _sp = await SharedPreferences.getInstance();
      //await _sp!.clear();
    }
  }
}
