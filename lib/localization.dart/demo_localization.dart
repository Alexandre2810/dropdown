import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class FlutterI18n {
  FlutterI18n(this.locale);

  final Locale locale;
  static FlutterI18n? of(BuildContext context) {
    return Localizations.of<FlutterI18n>(context, FlutterI18n);
  }

  late Map<String, String> _localizedValues;

  Future<void> load() async {
    String jsonStringValues =
        await rootBundle.loadString('lib/assets/i18,/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedValues[key];
  }

  // static member to have simple access to the delegate from Material App
  static const LocalizationsDelegate<FlutterI18n> delegate =
      _FlutterI18nsDelegate();
}

class _FlutterI18nsDelegate
    extends LocalizationsDelegate<FlutterI18n> {
  const _FlutterI18nsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<FlutterI18n> load(Locale locale) async {
    FlutterI18n localization = new FlutterI18n(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<FlutterI18n> old) => false;
}