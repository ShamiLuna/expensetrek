import 'package:get/get.dart';

import 'controller.dart';

// import '../controllers/onboard_controller.dart';

class EnterpinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterpinController>(
          () => EnterpinController(),
    );
  }
}
