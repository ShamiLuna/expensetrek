import 'package:get/get.dart';

import '../../addnew/controllers/addnew_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/bottom_controller.dart';

class BottomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomController>(
      () => BottomController(),
    );
    Get.lazyPut<AddnewController>(
          () => AddnewController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<BottomController>(
          () => BottomController(),
    );
  }
}
