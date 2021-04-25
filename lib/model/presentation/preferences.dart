import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_spa_sample/misc/preferences_singleton.dart';

class Preferences extends ChangeNotifier {
  static const String _localeParam = 'locale';
  Locale _locale = Locale('en', '');

  Locale get locale {
    var v = PreferencesSingleton.instance.getString(_localeParam);

    if (v == null) {
      return _locale;
    } else if (v != _locale.languageCode) {
      _locale = Locale(v, '');
    }

    return _locale;
  }

  set locale(Locale value) {
    if (value.languageCode != _locale.languageCode) {
      _locale = value;
      PreferencesSingleton.instance.setString(_localeParam, value.languageCode);
      notifyListeners();
    }
  }

  void switchLocale() {
    if (_locale.languageCode == 'en')
      locale = Locale('ru', '');
    else
      locale = Locale('en', '');
  }
}
