import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:your_app_path/signup/controllers/signup_controller.dart';

import '../../../routes/app_pages.dart';
import '../../signup/controllers/signupcontrollersecured.dart';

class LoginController extends GetxController {
  final SignupController signupController = Get.find<SignupController>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;
  Rx<bool> isShowPassword = false.obs;
  // final SignupController signupController = Get.find();

  RxString errorMessage = ''.obs;

  Future<void> validateLogin() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      errorMessage.value = '';
      Get.toNamed(Routes.PASSPIN); // ✅ Navigate to the next page
    } catch (e) {
      errorMessage.value = 'Invalid email or password. Please try again.';
    }
  }

}
