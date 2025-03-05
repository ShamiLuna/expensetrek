import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AgainpinController extends GetxController {
  //TODO: Implement AgainpinController

  bool hasError = false;
  //TODO: Implement PasspinController
  var onTapRecognizer;
  var context = BuildContext;
  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  // late FocusNode _focusNode ;


  final count = 0.obs;
  @override
  void onInit() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context as BuildContext);
      };
    errorController = StreamController<ErrorAnimationType>();
    // _focusNode= FocusNode();
    // FocusScope.of(context as BuildContext).requestFocus(_focusNode);
    super.onInit();
  }

  @override
  void dispose() {
    errorController.close();
    // _focusNode.dispose();
    super.dispose();
  }


  void increment() => count.value++;
}
class SecureStorageServicepin {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> storePin(String pin) async {
    await _storage.write(key: 'user_pin', value: pin);
    print("Stored PIN: $pin"); // Debugging
  }

  Future<String?> getPin() async {
    final pin = await _storage.read(key: 'user_pin');
    print("Retrieved PIN: $pin"); // Debugging
    return pin;
  }

  Future<void> deletePin() async {
    await _storage.delete(key: 'user_pin');
    print("Deleted PIN"); // Debugging
  }
}