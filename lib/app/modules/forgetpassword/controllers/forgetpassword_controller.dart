import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetpasswordController extends GetxController {
  //TODO: Implement ForgetpasswordController
  late final emailController = TextEditingController();
  final count = 0.obs;



  void increment() => count.value++;
}
