
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../localization/languagesettingpage.dart';
import '../modules/About/Aboutview.dart';
import '../modules/About/aboutbinding.dart';
import '../modules/Againpin/bindings/againpin_binding.dart';
import '../modules/Againpin/views/againpin_view.dart';
import '../modules/Bottom/bindings/bottom_binding.dart';
import '../modules/Bottom/views/bottom_view.dart';
import '../modules/Budget/bindings/budget_binding.dart';
import '../modules/Budget/views/budget_view.dart';
import '../modules/Emailonway/bindings/emailonway_binding.dart';
import '../modules/Emailonway/views/emailonway_view.dart';
import '../modules/Enterpin/Bindings.dart';
import '../modules/Enterpin/Enterpin.dart';
import '../modules/Help/helpbindings.dart';
import '../modules/Help/helpview.dart';
import '../modules/LandingPage/bindings/landing_page_binding.dart';
import '../modules/LandingPage/views/landing_page_view.dart';
import '../modules/Privacy policy/binding.dart';
import '../modules/Privacy policy/privacy.dart';
import '../modules/Reset/bindings/reset_binding.dart';
import '../modules/Reset/views/reset_view.dart';
import '../modules/Settings/bindings.dart';
import '../modules/Settings/items.dart';
import '../modules/Splash screen/Splash View.dart';
import '../modules/Splash screen/bindings.dart';
import '../modules/Tab/bindings/tab_binding.dart';
import '../modules/Tab/views/tab_view.dart';
import '../modules/Tabwadd/bindings/tabwadd_binding.dart';
import '../modules/Tabwadd/views/tabwadd_view.dart';
import '../modules/Transactions/bindings/transactions_binding.dart';
import '../modules/Transactions/views/transactions_view.dart';
import '../modules/addnew/bindings/addnew_binding.dart';
import '../modules/addnew/views/addnew_view.dart';
import '../modules/allset/bindings/allset_binding.dart';
import '../modules/allset/views/allset_view.dart';
import '../modules/createbudget/bindings/c_budget_binding.dart';
import '../modules/createbudget/views/c_budget_view.dart';
import '../modules/detailexpense/bindings/detailexpense_binding.dart';
import '../modules/detailexpense/views/detailexpense_view.dart';
import '../modules/detailincome/bindings/detailincome_binding.dart';
import '../modules/detailincome/views/detailincome_view.dart';
import '../modules/forgetpassword/bindings/forgetpassword_binding.dart';
import '../modules/forgetpassword/views/forgetpassword_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/controllers/home_controller.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboard/bindings/onboard_binding.dart';
import '../modules/onboard/views/onboard_view.dart';
import '../modules/passpin/bindings/passpin_binding.dart';
import '../modules/passpin/views/passpin_view.dart';
import '../modules/pincode/bindings/pincode_binding.dart';
import '../modules/pincode/views/pincode_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/mainsignupview.dart';
import '../modules/somemore/somemorebinding.dart';
import '../modules/somemore/somemoreview.dart';


part 'app_routes.dart';

class AppPages {
  final HomeController controllerr = Get.put(HomeController());
  AppPages._();
  static const INITIAL = Routes.SPLASH;
  static const String theme = 'theme';
  static final routes = [
    GetPage(
      name: Routes.SOMEMORE,
      page: () =>  Somemoreview(),
      curve: Curves.fastOutSlowIn,
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
      binding: Somemorebinding(),
    ),
    GetPage(
      name: Routes.HELP,
      page: () => const HelpPage(),
      binding: Helpbindings(),

    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: Routes.LANG,
      page: () =>  LanguageSettingsPage(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.PRIVACY,
      page: () => const PrivacyPolicyPage(),
      binding: PrivacyBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      // curve: Curves.fastLinearToSlowEaseIn,
      // transition: Transition.zoom,
      // transitionDuration: const Duration(milliseconds: 500),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.FORGETPASSWORD,
      page: () => const ForgetpasswordView(),
      binding: ForgetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      curve: Curves.fastLinearToSlowEaseIn,
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
      binding: LoginBinding(),
    ),
    // GetPage(
    //   name: _Paths.PINCODE,
    //   page: () => PincodeView(),
    //   binding: PincodeBinding(),
    // ),
    GetPage(
      name: _Paths.EMAILONWAY,
      page: () => const EmailonwayView(),
      binding: EmailonwayBinding(),
    ),
    GetPage(
      name: _Paths.RESET,
      page: () => const ResetView(),
      binding: ResetBinding(),
    ),
    GetPage(
      name: _Paths.PASSPIN,
      page: () => PasspinView(),
      binding: PasspinBinding(),
    ),
    // GetPage(
    //   name: _Paths.SETUPACCOUNT,
    //   page: () => const SetupaccountView(),
    //   binding: SetupaccountBinding(),
    // ),
    GetPage(
      name: _Paths.ADDNEW,
      page: () => const AddnewView(),
      binding: AddnewBinding(),
    ),
    GetPage(
      name: _Paths.ALLSET,
      page: () =>  const AllsetView(),
      binding: AllsetBinding(),
    ),
    GetPage(
      name: _Paths.AGAINPIN,
      page: () => AgainpinView(),
      binding: AgainpinBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTIONS,
      page: () =>  TransactionsView(),
      binding: TransactionsBinding(),
    ),
    // GetPage(
    //   name: _Paths.STATISTICS,
    //   page: () => StatisticsView(),
    //   binding: StatisticsBinding(),
    // ),
    GetPage(
      name: _Paths.PROFILE,
      page: () =>  ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM,
      page: () =>  BottomNavBar(),
      binding: BottomBinding(),
    ),
    GetPage(
      name: _Paths.TAB,
      page: () => Tabn(),
      binding: TabBinding(),
    ),
    GetPage(
      name: _Paths.TABWADD,
      page: () => const TabwaddView(),
      binding: TabwaddBinding(),
    ),
    GetPage(
      name: _Paths.LANDING_PAGE,
      page: () => LandingPage(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: _Paths.BUDGET,
      page: () => BudgetView(),
      binding: BudgetBinding(),
    ),
    GetPage(
      name: _Paths.C_BUDGET,
      page: () => CBudgetView(),
      curve: Curves.fastEaseInToSlowEaseOut,
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
      binding: CBudgetBinding(),
    ),
    // GetPage(
    //   name: _Paths.CUSTOMLISTTILE,
    //   page: () => const CustomlisttileView(),
    //   binding: CustomlisttileBinding(),
    // ),
    // GetPage(
    //   name: _Paths.CUSTOML2,
    //   // page: () => CustomListView2(),
    //   binding: Customl2Binding(),
    // ),

    GetPage(
      name: _Paths.DETAILEXPENSE,
      page: () =>  DetailexpenseView(itemKey: '',),
      binding: DetailexpenseBinding(),
    ),
    GetPage(
      name: _Paths.DETAILINCOME,
      page: () =>  DetailincomeView(itemKey: '',),
      binding: DetailincomeBinding(),
    ),
    GetPage(
      name: _Paths.ENTERPIN,
      page: () => EnterPinScreen(),
      binding: EnterpinBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingsPage(),
      binding: Settingbinding(),
    ),
  ];
}
