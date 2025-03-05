import 'dart:async';
// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PincodeController extends GetxController {
  var onTapRecognizer;
  var context = BuildContext;
  final FocusNode _focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  late StreamController<ErrorAnimationType> errorController;


  bool hasError = false;
  String currentText = "";
  //TODO: Implement PincodeController

  final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  @override
  void onInit() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context as BuildContext);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.onInit();

  }

  @override
  void dispose() {
    errorController.close();
    _focusNode.dispose();
    super.dispose();
  }



  void increment() => count.value++;
}
