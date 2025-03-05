import 'package:get/get.dart';

import '../controllers/allset_controller.dart';

class AllsetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllsetController>(
      () => AllsetController(),
    );
  }
}
