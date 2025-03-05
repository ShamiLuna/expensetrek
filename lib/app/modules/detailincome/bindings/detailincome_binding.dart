import 'package:get/get.dart';

import '../controllers/detailincome_controller.dart';

class DetailincomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailincomeController>(
      () => DetailincomeController(),
    );
  }
}
