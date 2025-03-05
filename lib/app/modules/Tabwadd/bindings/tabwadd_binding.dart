import 'package:get/get.dart';

import '../controllers/tabwadd_controller.dart';

class TabwaddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabwaddController>(
      () => TabwaddController(),
    );
  }
}
