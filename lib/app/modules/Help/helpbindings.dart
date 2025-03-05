import 'package:get/get.dart';

import 'helpcontroller.dart';





class Helpbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpController>(
          () =>  HelpController(),
    );
  }
}
