import 'package:get/get.dart';

import '../controllers/signupcontrollersecured.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
