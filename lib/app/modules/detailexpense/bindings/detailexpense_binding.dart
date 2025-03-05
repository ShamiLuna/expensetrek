import 'package:get/get.dart';

import '../controllers/detailexpense_controller.dart';

class DetailexpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailexpenseController>(
      () => DetailexpenseController(),
    );
  }
}
