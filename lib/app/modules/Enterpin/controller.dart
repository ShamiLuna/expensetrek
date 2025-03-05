import 'package:get/get.dart';

// import '../../../routes/app_pages.dart';

class EnterpinController extends GetxController {
  //TODO: Implement OnboardController

  final count = 0.obs;

  void increment() => count.value++;
  var currentIndex = 0.0.obs;

  void updateIndex(int index) {
    currentIndex.value = index.toDouble();
  }
}