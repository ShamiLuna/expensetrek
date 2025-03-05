import 'package:get/get.dart';

import 'aboutcontroller.dart';



class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(
          () => AboutController(),
    );
  }
}
