



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Budget/controllers/budget_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/c_budget_controller.dart';

enum PaymentOption {
  Food,
  Transport,
  Education,
}

class CBudgetView extends GetView<CBudgetController> {
  final HomeController controllerh = Get.put(HomeController());
  final BudgetController controllerb = Get.put(BudgetController());
  final TextEditingController paymentController = TextEditingController();
  final TextEditingController amtspend = TextEditingController();
  final Rx<PaymentOption?> selectedPayment = Rx<PaymentOption?>(null);
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  CBudgetView({super.key});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: GestureDetector(
              child:  Icon(Icons.arrow_back_rounded,color: Theme.of(context).primaryColorLight,),
              onTap: () {
                Get.back();
              },
            ),
          ),
          title:  Text(
            'Create Budget'.tr,
            style:  TextStyle(
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,color: Theme.of(context).primaryColorLight,
            ),
          ),
          backgroundColor: Theme.of(context).cardColor,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 180),
               Opacity(
                opacity: 0.64,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Text(
                      'How much do you want to spend?'.tr,
                      style:  TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w600,color: Theme.of(context).primaryColorLight),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Opacity(
                  opacity: 0.64,
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: TextFormField(
                      controller: amtspend,
                      style: TextStyle(fontSize: 80, color: Theme.of(context).primaryColor),
                      decoration: const InputDecoration(
                        hintText: "\u{20B9}00.0",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 4),
                        child: DropdownMenu<PaymentOption>(
                          width: 0.9 * MediaQuery.of(Get.context!).size.width,
                          initialSelection: PaymentOption.Food,
                          controller: paymentController,
                          requestFocusOnTap: true,
                          label: const Text('Category ',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold),),
                          onSelected: selectedPayment.call,
                          dropdownMenuEntries: PaymentOption.values.map<DropdownMenuEntry<PaymentOption>>(
                                (PaymentOption option) => DropdownMenuEntry<PaymentOption>(
                              value: option,
                              label: option.toString().split('.').last,
                            ),
                          ).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Obx(() {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Text(
                                  selectedDate.value == null
                                      ? 'Select Date'
                                      : DateFormat('yyyy-MM-dd').format(selectedDate.value!),
                                  style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Theme.of(context).cardColor,
                          ),
                          onPressed: () async {
                            String amount = amtspend.text;
                            String title = paymentController.text;
                            DateTime? date = selectedDate.value;
                            String category = selectedPayment.value.toString().split('.').last;

                            await controllerh.fetchbudTitlesFromStorage();

                            if (title.isNotEmpty && amount.isNotEmpty && date != null && category.isNotEmpty) {
                              await controllerh.writebudTitleToStorage(
                                title,
                                '', // subTitle will be updated later
                                amount,
                                DateFormat('yyyy-MM-dd').format(date), // time
                                category,
                              );
                              paymentController.clear();
                              amtspend.clear();
                              selectedDate.value = null;
                              _showSuccessDialog(Get.context!);
                            }
                          },
                          child:  SizedBox(
                            height: 56,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                'Continue'.tr,
                                style:  TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Budget has been successfully added!', style: TextStyle(fontFamily: 'Roboto')),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
