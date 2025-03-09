import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:flutter/foundation.dart'; // ✅ Fixes kIsWeb issue
import 'dart:io' show Platform;

import 'app/localization/apptranslation.dart';
import 'app/localization/lang_controller.dart';
import 'app/modules/Budget/controllers/budget_controller.dart';
import 'app/modules/Splash screen/splashcontroller.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/modules/profile/controllers/profile_controller.dart';
import 'app/modules/signup/controllers/signupcontrollersecured.dart';
import 'app/routes/app_pages.dart';
import 'app/services/firebase_options.dart';
import 'app/services/local_notification.dart';
import 'app/services/theme_provider.dart';

// ✅ Handles background FCM messages
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("🔔 [FCM] Background Message: ${message.notification?.title}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final stopwatch = Stopwatch()..start(); // ✅ Measure startup time

  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    debugPrint("✅ [Firebase] Initialized successfully");
  } catch (e) {
    debugPrint("❌ [Firebase] Initialization failed: $e");
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  try {
    await GetStorage.init();
    debugPrint("✅ [GetStorage] Initialized successfully");
  } catch (e) {
    debugPrint("❌ [GetStorage] Initialization failed: $e");
  }

  // ✅ Initialize Language Controller safely
  final LanguageController languageController = Get.put(LanguageController());
  await languageController.loadLocale();
  Locale safeLocale = languageController.parseLocale(languageController.locale); // ✅ Ensuring valid locale

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // ✅ Initialize Firebase Messaging & Local Notifications
  final LocalNotificationService localNotificationService = LocalNotificationService();
  if (!kIsWeb) {
    try {
      await localNotificationService.initializeFCM();
      await localNotificationService.scheduleNotification();
      debugPrint("✅ [Notifications] Initialized & Scheduled successfully");
    } catch (e) {
      debugPrint("❌ [Notifications] Initialization failed: $e");
    }
  }

  // ✅ Initialize controllers efficiently
  try {
    Get.put(SplashController());
    Get.put(SignupController());
    Get.put(HomeController());
    Get.put(BudgetController());
    Get.put(ProfileController());
    debugPrint("✅ [GetX] Controllers initialized successfully");
  } catch (e) {
    debugPrint("❌ [GetX] Controller initialization failed: $e");
  }

  stopwatch.stop();
  debugPrint("🚀 App Startup Time: ${stopwatch.elapsedMilliseconds} ms");

  runApp(MyApp(safeLocale: safeLocale));
}

class MyApp extends StatelessWidget {
  final Locale safeLocale;
  const MyApp({Key? key, required this.safeLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Expense Trek",
          builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(410, name: MOBILE),
              ResponsiveBreakpoint.autoScale(410, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
            ],
          ),
          translations: AppTranslations(),
          locale: safeLocale, // ✅ Ensured valid locale
          fallbackLocale: const Locale('en', 'US'),
          themeMode: themeProvider.themeMode,
          theme: themeProvider.currentTheme,
          darkTheme: MyThemes.darkTheme,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
