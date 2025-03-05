
import 'package:ExpenseTrek/app/modules/Privacy%20policy/privacycontroller.dart';
import 'package:get/get.dart';



class PrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Privacycontroller>(
          () => Privacycontroller(),
    );
  }
}
