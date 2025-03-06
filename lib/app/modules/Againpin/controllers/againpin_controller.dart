import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AgainpinController extends GetxController {
  bool hasError = false;
  late TapGestureRecognizer onTapRecognizer;
  late StreamController<ErrorAnimationType> errorController;
  TextEditingController textEditingController = TextEditingController();

  AgainpinController() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        if (Get.context != null) {
          Navigator.pop(Get.context!);
        }
      };

    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    errorController.close();
    textEditingController.dispose();
    super.dispose();
  }
}
