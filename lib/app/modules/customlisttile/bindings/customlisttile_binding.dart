import 'package:get/get.dart';

import '../controllers/customlisttile_controller.dart';

class CustomlisttileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomlisttileController>(
      () => CustomlisttileController(),
    );
  }
}
