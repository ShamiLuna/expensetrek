import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class TranslationService extends Translations {
  static Map<String, Map<String, String>> _translations = {};

  static Future<void> loadTranslations() async {
    final enUs = await rootBundle.loadString('assets/locales/en_US.json');
    final esEs = await rootBundle.loadString('assets/locales/es_ES.json');
    final frFr = await rootBundle.loadString('assets/locales/fr_FR.json');
    final deDe = await rootBundle.loadString('assets/locales/de_DE.json');

    _translations = {
      'en_US': Map<String, String>.from(json.decode(enUs)),
      'es_ES': Map<String, String>.from(json.decode(esEs)),
      'fr_FR': Map<String, String>.from(json.decode(frFr)),
      'de_DE': Map<String, String>.from(json.decode(deDe)),
    };
  }

  @override
  Map<String, Map<String, String>> get keys => _translations;
}
