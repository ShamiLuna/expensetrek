// import 'dart:ui';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
//
// class LanguageController extends GetxController {
//   final _storage = FlutterSecureStorage(); // Use FlutterSecureStorage for secure storage
//   RxString _locale = ''.obs;
//
//   String get locale => _locale.value;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadLocale();
//   }
//
//   Future<void> _loadLocale() async {
//     final savedLocale = await _storage.read(key: 'locale');
//     print(savedLocale);
//     if (savedLocale != null) {
//       _locale.value = savedLocale;
//     } else {
//       // Default to English locale if no locale is saved
//       _locale.value = 'en_US';
//     }
//     Get.updateLocale(_parseLocale(_locale.value));
//   }
//
//   Locale _parseLocale(String locale) {
//     final parts = locale.split('_');
//     return Locale(parts[0], parts.length > 1 ? parts[1] : '');
//   }
//
//   void changeLanguage(String languageCode, String countryCode) async {
//     final newLocale = '$languageCode _$countryCode';
//     Get.updateLocale(Locale(languageCode, countryCode));
//     _locale.value = newLocale;
//     await _storage.write(key: 'locale', value: newLocale); // Store selected locale
//   }
// }
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final _storage = const FlutterSecureStorage(); // Use FlutterSecureStorage for secure storage
  final RxString _locale = ''.obs;

  String get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    loadLocale();
  }

  Future<void> loadLocale() async {
    final savedLocale = await _storage.read(key: 'locale');
    if (savedLocale != null) {
      _locale.value = savedLocale;
      print('Locale retrieved from storage: $savedLocale');
    } else {
      // Default to English locale if no locale is saved
      _locale.value = 'en_US';
      print('No locale found in storage. Defaulting to English.');
    }
    Get.updateLocale(parseLocale(_locale.value));
  }

  Locale parseLocale(String? locale) {
    try {
      if (locale == null || locale.isEmpty) {
        debugPrint("❌ Invalid locale found, setting default 'en_US'");
        return const Locale('en', 'US'); // ✅ Default locale
      }

      List<String> parts = locale.split('_');
      if (parts.length == 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
        return Locale(parts[0], parts[1]); // ✅ Valid locale
      }

      debugPrint("❌ Malformed locale '$locale', using fallback.");
      return const Locale('en', 'US'); // ✅ Prevent crash
    } catch (e) {
      debugPrint("❌ Exception in parseLocale: $e");
      return const Locale('en', 'US'); // ✅ Fallback in case of error
    }
  }



  void changeLanguage(String languageCode, String countryCode) async {
    final newLocale = '$languageCode _$countryCode';
    Get.updateLocale(Locale(languageCode, countryCode));
    _locale.value = newLocale;
    await _storage.write(key: 'locale', value: newLocale); // Store selected locale
    print('Locale stored: $newLocale');
  }
}
