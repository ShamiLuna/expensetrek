import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../home/controllers/home_controller.dart';

class TransactionsController extends GetxController {

  final HomeController controllerh = Get.put(HomeController());
  final count = 0.obs;
  var filteredTransactions = <CustomListItem>[].obs;
  var filteredIncomeTransactions = <CustomListItem1>[].obs;
  var selectedFilter = 'Daily'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
    controllerh.deleteTitleFromStorage;
    controllerh.updateSelectedDate2;
    controllerh.updateSelectedDate;
    // signupController.getUserData();
  }


//filter transaction page
  void fetchTransactions() {
    controllerh.fetchTitlesFromStorage();
    controllerh.fetchTitlesFromStorage1();
    // applyFilter();
  }

  void applyFilter() {
    controllerh.updateFilter(selectedFilter.value);
    filteredTransactions.value = controllerh.filteredTransactions
        .map((data) => CustomListItem(
      key: data['key'] ?? '',
      title: data['title'] ?? '',
      subTitle: data['subTitle'] ?? '',
      amount: data['amount'] ?? '',
      time: data['time'] ?? '',
      gst: data['gst'] ?? '',
      receipt: data['receipt'] ?? '',
      invoice: data['invoice'] ?? '',
      vendor: data['vendor'] ?? '',
      tag: data['tag'] ?? '',
      account: data['account'] ?? '',
      fileBase64: data['fileBase64'] ?? '',
    ))
        .toList();

    filteredIncomeTransactions.value = controllerh.filteredIncomeTransactions
        .map((data) => CustomListItem1(
      key: data['key'] ?? '',
      title: data['title'] ?? '',
      subTitle: data['subTitle'] ?? '',
      amount: data['amount'] ?? '',
      time: data['time'] ?? '',
      tag: data['tag'] ?? '',
      fileBase64: data['fileBase64'] ?? '',
    ))
        .toList();
  }
}




//items are future added one fetched data should explain then do filter in bottom sheet