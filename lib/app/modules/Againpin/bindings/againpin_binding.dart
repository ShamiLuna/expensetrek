import 'package:get/get.dart';

import '../controllers/againpin_controller.dart';

class AgainpinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgainpinController>(
      () => AgainpinController(),
    );
  }
}
