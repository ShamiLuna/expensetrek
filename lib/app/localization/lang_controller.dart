import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final RxString _locale = 'en_US'.obs; // ✅ Default to English (en_US)

  String get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    loadLocale();
  }

  /// ✅ Load locale from secure storage
  Future<void> loadLocale() async {
    try {
      final savedLocale = await _storage.read(key: 'locale');
      if (savedLocale != null && savedLocale.isNotEmpty) {
        _locale.value = savedLocale;
        debugPrint('🌍 Loaded stored locale: $savedLocale');
      } else {
        _locale.value = 'en_US'; // ✅ Default to English
        debugPrint('❌ No saved locale found. Defaulting to English (en_US)');
      }
      Get.updateLocale(parseLocale(_locale.value));
    } catch (e) {
      debugPrint("❌ Error loading locale: $e");
      _locale.value = 'en_US'; // ✅ Safe fallback
    }
  }

  /// ✅ Parse locale safely
  Locale parseLocale(String locale) {
    try {
      if (locale.isEmpty) {
        debugPrint("❌ Empty locale found, defaulting to 'en_US'");
        return const Locale('en', 'US');
      }
      List<String> parts = locale.split('_');
      if (parts.length == 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
        return Locale(parts[0], parts[1]);
      }
      debugPrint("❌ Malformed locale '$locale', using fallback.");
      return const Locale('en', 'US');
    } catch (e) {
      debugPrint("❌ Exception in parseLocale: $e");
      return const Locale('en', 'US');
    }
  }

  /// ✅ Change language and persist it
  Future<void> changeLanguage(String languageCode, String countryCode) async {
    try {
      final newLocale = '${languageCode}_$countryCode'.trim(); // ✅ Remove spaces
      _locale.value = newLocale;
      await _storage.write(key: 'locale', value: newLocale);
      Get.updateLocale(parseLocale(newLocale));
      debugPrint('✅ Locale changed & stored: $newLocale');
    } catch (e) {
      debugPrint("❌ Error saving locale: $e");
    }
  }
}
