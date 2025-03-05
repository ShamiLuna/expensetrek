import 'package:get/get.dart';

import '../controllers/emailonway_controller.dart';

class EmailonwayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailonwayController>(
      () => EmailonwayController(),
    );
  }
}
