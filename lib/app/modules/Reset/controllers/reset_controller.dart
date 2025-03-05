import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetController extends GetxController {
  late final passwordController = TextEditingController();
  // bool passToggle = true;
  Rx<bool> isShowPassword = true.obs;
  //TODO: Implement ResetController

  final count = 0.obs;



  void increment() => count.value++;
}
