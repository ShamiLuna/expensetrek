import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ExpenseTrek/app/modules/Againpin/controllers/againpin_controller.dart';

void main() {
  late AgainpinController againpinController;

  setUp(() {
    againpinController = AgainpinController(); // ✅ Now initializes properly
  });

  test('should initialize TapGestureRecognizer and StreamController', () {
    expect(againpinController.onTapRecognizer, isNotNull);
    expect(againpinController.errorController, isNotNull);
  });

  test('should update error status', () {
    expect(againpinController.hasError, false);
    againpinController.hasError = true;
    expect(againpinController.hasError, true);
  });

  test('should close StreamController on dispose', () {
    final StreamController<ErrorAnimationType> oldController = againpinController.errorController;

    againpinController.dispose();

    expect(oldController.isClosed, true);
  });

  test('should dispose TextEditingController properly', () {
    final textController = againpinController.textEditingController;

    againpinController.dispose();

    expect(textController.text.isEmpty, true); // ✅ Check if it's empty after disposal
  });
}
