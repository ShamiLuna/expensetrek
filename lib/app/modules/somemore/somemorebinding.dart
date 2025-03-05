import 'package:ExpenseTrek/app/modules/somemore/somecontroller.dart';
import 'package:get/get.dart';

class Somemorebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Somecontroller>(
          () => Somecontroller(),
    );
  }
}

