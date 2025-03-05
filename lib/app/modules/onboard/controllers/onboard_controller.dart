import 'package:get/get.dart';


class OnboardController extends GetxController {
  //TODO: Implement OnboardController

  final count = 0.obs;

  void increment() => count.value++;
  var currentIndex = 0.0.obs;

  void updateIndex(int index) {
    currentIndex.value = index.toDouble();
  }


  // final storage = FlutterSecureStorage();
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   checkForPin();
  // }
  //
  // void checkForPin() async {
  //   final pin = await storage.read(key: 'user_pin');
  //   if (pin != null) {
  //     Get.offAllNamed(Routes.PASSPIN); // Show PIN entry view
  //   } else {
  //     Get.offAllNamed(Routes.SIGNUP); // Or your signup route
  //   }
  // }
}
