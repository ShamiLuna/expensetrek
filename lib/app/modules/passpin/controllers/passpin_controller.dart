// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// class PasspinController extends GetxController {
//   bool hasError = false;
//   //TODO: Implement PasspinController
//   var onTapRecognizer;
//   var context = BuildContext;
//   TextEditingController textEditingController = TextEditingController();
//   late StreamController<ErrorAnimationType> errorController;
//   // late FocusNode _focusNode ;
//   final FocusNode _focusNode = FocusNode();z
//
//   final count = 0.obs;
//   @override
//   void onInit() {
//     onTapRecognizer = TapGestureRecognizer()
//       ..onTap = () {
//         Navigator.pop(context as BuildContext);
//       };
//     errorController = StreamController<ErrorAnimationType>();
//
//     // _focusNode= FocusNode();
//     // FocusScope.of(context as BuildContext).requestFocus(_focusNode);
//     super.onInit();
//   }
//
//   @override
//   void dispose() {
//     errorController.close();
//     _focusNode.dispose();
//     // _focusNode.dispose();
//     super.dispose();
//   }
//
//
//
//   void increment() => count.value++;
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PasspinController extends GetxController {
  final textEditingController = TextEditingController();
  final errorController = StreamController<ErrorAnimationType>();
  var hasError = false.obs;
}

