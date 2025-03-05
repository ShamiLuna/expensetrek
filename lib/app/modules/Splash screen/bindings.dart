import 'package:ExpenseTrek/app/modules/Splash%20screen/splashcontroller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
