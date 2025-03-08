import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'dart:io' show Platform; // ✅ Detects platform
import 'package:flutter/foundation.dart'; // ✅ Fixes kIsWeb error

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
  print("🔔 [FCM] Background Message: ${message.notification?.title}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Try-Catch for Firebase Initialization
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    print("✅ [Firebase] Initialized successfully");
  } catch (e) {
    print("❌ [Firebase] Initialization failed: $e");
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // ✅ Initialize GetStorage (Local Storage)
  try {
    await GetStorage.init();
    print("✅ [GetStorage] Initialized successfully");
  } catch (e) {
    print("❌ [GetStorage] Initialization failed: $e");
  }

  // ✅ Initialize Language Controller
  final LanguageController languageController = Get.put(LanguageController());
  await languageController.loadLocale();

  // ✅ Initialize Firebase Messaging
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // ✅ Initialize Firebase Messaging (FCM) & Local Notifications
  final LocalNotificationService localNotificationService = LocalNotificationService();
  try {
    await localNotificationService.initializeFCM();
    print("✅ [FCM] Firebase Messaging initialized successfully");
  } catch (e) {
    print("❌ [FCM] Initialization failed: $e");
  }

  // ✅ Schedule local notifications only if NOT on Web
  if (!kIsWeb) {
    try {
      await localNotificationService.scheduleNotification();
      print("✅ [Local Notifications] Scheduled successfully");
    } catch (e) {
      print("❌ [Local Notifications] Scheduling failed: $e");
    }
  }

  // ✅ Register controllers in GetX
  try {
    Get.put(SplashController());
    Get.put(SignupController());
    Get.put(HomeController());
    Get.put(BudgetController());
    Get.put(ProfileController());
    print("✅ [GetX] Controllers initialized successfully");
  } catch (e) {
    print("❌ [GetX] Controller initialization failed: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final LanguageController languageController = Get.find<LanguageController>();

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
          locale: languageController.parseLocale(languageController.locale),
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
