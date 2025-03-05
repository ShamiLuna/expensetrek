import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController
    with SingleGetTickerProviderMixin {
  var selectedIndex = 0.obs;
  var valueString;

  late TabController tabController; // Define the TabController property
  // final HomeController controller = Get.find(HomeController());
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);

    // getString();
    // fetchDataFromStorage();
    // tabController = TabController(length: 3, vsync: AnimatedListState());
  }

  @override
  void onClose() {
    tabController
        .dispose(); // Dispose the TabController when the controller is closed
    super.onClose();
  }

  void selectTab(int index) {
    selectedIndex.value = index;
  }

// Future<void> fetchDataFromStorage() async {
//   var storedData = await _secureStorage.readAll();
//   List<Map<String, String>> data = [];
//   storedData.forEach((key, value) {
//     data.add({'key': key, 'value': value});
//   });
//   controller.dataList.assignAll(data);
// }
// Future<void> updateSecureStorage(String key, String value) async {
//   // Add the new data to the secure storage
//   await _secureStorage.write(key: key, value: value);
//   // Add the new data to the dataList
//   dataList.add({'key': key, 'value': value});
// }
}
