import 'package:get/get.dart';

class AddnewController extends GetxController {
  List<String> options = ["Cash", "Bank", "Card"];
  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;
  //TODO: Implement AddnewController
  var selectedAccountType = ''.obs; // Define an observable variable

  void setSelectedAccountType(String newValue) {
    selectedAccountType.value = newValue; // Update the value of selectedAccountType
  }
  final count = 0.obs;



  void increment() => count.value++;
}
