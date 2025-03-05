import 'package:ExpenseTrek/app/modules/Settings/scontroller.dart';
import 'package:get/get.dart';

// import '../controllers/reset_controller.dart';

class Settingbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Scontroller>(
          () => Scontroller(),
    );
  }
}
