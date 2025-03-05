import 'package:get/get.dart';

import '../controllers/passpin_controller.dart';

class PasspinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasspinController>(
      () => PasspinController(),
    );
  }
}
