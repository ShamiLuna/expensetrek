import 'package:get/get.dart';

import '../controllers/c_budget_controller.dart';

class CBudgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CBudgetController>(
      () => CBudgetController(),
    );
  }
}
