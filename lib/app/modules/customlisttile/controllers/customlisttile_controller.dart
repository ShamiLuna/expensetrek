import 'package:get/get.dart';

class CustomlisttileController extends GetxController {
  //TODO: Implement CustomlisttileController
  var items = <CustomListItem>[].obs;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // Initialize with dummy data
    items.add(CustomListItem(
      title: 'Shopping',
      subTitle: 'Buy some grocery',
      amount: '120',
      time: '10:00 AM',
    ));
  }
  void addItem({
    required String title,
    required String subTitle,
    required String amount,
    required String time,
  }) {
    items.add(CustomListItem(
      title: title,
      subTitle: subTitle,
      amount: amount,
      time: time,
    ));
  }


  void increment() => count.value++;
}
class CustomListItem {
  final String title;
  final String subTitle;
  final String amount;
  final String time;

  CustomListItem({
    required this.title,
    required this.subTitle,
    required this.amount,
    required this.time,
  });
}
