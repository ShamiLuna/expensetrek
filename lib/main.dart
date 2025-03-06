import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
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
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



// Import SignupController

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform, // Only for FlutterFire CLI setup
//   );
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//
//   // Initialize GetStorage and FlutterSecureStorage
//   await GetStorage.init();
//
//   final LanguageController languageController = Get.put(LanguageController());
//   // Load saved locale from secure storage
//   // Initialize LanguageController
//
//
//   // Load saved locale
//   await languageController.loadLocale();
//
//   // Apply locale
//   // MyApp app = MyApp(savedLocale: savedLocale);
//   // Initialize controllers
//   // Get.put(LanguageController());
//   Get.put(SplashController());
//   Get.put(HomeController());
//   Get.put(BudgetController());
//   Get.put(SignupController());
//   Get.put(ProfileController());
//   // Initialize SignupController
//   // 🔹 Initialize Local Notifications
//   await LocalNotificationService.initialize();
//
//   // 🔹 Schedule Notifications
//   LocalNotificationService.scheduleNotificationAfterInstall();
//   LocalNotificationService.scheduleDailyExpenseReminder();
//   LocalNotificationService.scheduleWeeklyBudgetCheck();
//   runApp(const MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await GetStorage.init();
  final LanguageController languageController = Get.put(LanguageController());
  await languageController.loadLocale();

  // ✅ Create and initialize local notifications
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final localNotificationService = LocalNotificationService(flutterLocalNotificationsPlugin);
  await localNotificationService.initialize();

  // ✅ Schedule Notifications
  await localNotificationService.scheduleNotificationAfterInstall();
  await localNotificationService.scheduleDailyExpenseReminder();
  await localNotificationService.scheduleWeeklyBudgetCheck();
  Get.put(SplashController());
  Get.put(SignupController());
  Get.put(HomeController());
  Get.put(BudgetController());
  Get.put(ProfileController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final Locale savedLocale;

  // const MyApp({Key? key, required this.savedLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final LanguageController languageController = Get.find<LanguageController>();
        return GetMaterialApp(
          showPerformanceOverlay: false,// Use GetMaterialApp
          debugShowMaterialGrid: false,
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
              ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
            ],
          ),
          translations: AppTranslations(), // Initialize translations
          locale: languageController.parseLocale(languageController.locale),
          fallbackLocale: const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
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



