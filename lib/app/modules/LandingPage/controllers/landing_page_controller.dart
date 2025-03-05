import 'package:get/get.dart';

class LandingPageController extends GetxController {
  //TODO: Implement LandingPageController


  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
  tabIndex.value = index;
  }


  }