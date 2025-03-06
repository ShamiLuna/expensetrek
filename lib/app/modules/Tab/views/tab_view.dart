

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/tab_controller.dart';

enum PaymentOptionexpense {
  Food,
  Transport,
  Education,
  Housing,
  Utilities,
  Healthcare,
  Insurance,
  Entertainment,
  Clothing,
  PersonalCare,
  Childcare,
  Savings,
  Investments,
  DebtRepayment,
  Travel,
  DiningOut,
  Groceries,
  Fitness,
  Gifts,
  Donations,
  Subscriptions,
  Maintenance,
  Electronics,
  Pets,
  Books,
  OfficeSupplies,
  Taxes,
  LegalFees,
  ProfessionalServices,
  Memberships,
  Training,
  Advertising,
  Marketing,
  Software,
  Hardware,
  Rental,
  Repairs,
  Fuel,
  Parking,
  TollFees,
  Fines,
  Interest,
  BankCharges,
  BrokerageFees,
  MovingExpenses,
  Laundry,
  MedicalSupplies,
  Therapy,
  Counseling,
  Miscellaneous,
}
enum PaymentOptionincome {
  Cash,
  Bank,
  Card,
  Salary,
  Bonus,
  Commission,
  Freelance,
  Interest,
  Dividends,
  RentalIncome,
  BusinessIncome,
  Royalties,
  CapitalGains,
  SocialSecurity,
  Pension,
  Annuities,
  Alimony,
  ChildSupport,
  Scholarships,
  Grants,
  Stipends,
  Tips,
  Refunds,
  InsuranceClaims,
  GiftsReceived,
  Prizes,
  Awards,
  Inheritance,
  TrustDistributions,
  PartnershipIncome,
  LLCIncome,
  SCorpDistributions,
  REITDistributions,
  FarmIncome,
  FishingIncome,
  CropInsuranceProceeds,
  ConservationPayments,
  PatronageDividends,
  LegalSettlements,
  LotteryWinnings,
  GamblingWinnings,
  SeverancePay,
  BackPay,
  EmployeeStockOptions,
  MilitaryPay,
  VeteranBenefits,
  UnemploymentCompensation,
  WorkersCompensation,
  DisabilityBenefits,
  RoyaltiesFromBooks,
  RoyaltiesFromMusic,
  RoyaltiesFromPatents,
  Crowdfunding,
}

enum PaymentOption1 {
  Cash,
  Bank,
  Card,
}

// class HomeController extends GetxController with SingleGetTickerProviderMixin {
//   late TabController tabController;
//
//   @override
//   void onInit() {
//     tabController = TabController(length: 2, vsync: this);
//     super.onInit();
//   }
//
//   @override
//   void onClose() {
//     tabController.dispose();
//     super.onClose();
//   }
// }

class Tabn extends GetView {
  @override
  final TabBarController controller = Get.put(TabBarController());
  final HomeController controller1 = Get.put(HomeController());
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController Des = TextEditingController();

  // final TextEditingController amt = TextEditingController();
  final TextEditingController Des1 = TextEditingController();
  final TextEditingController Receipt = TextEditingController();
  final TextEditingController Invoice = TextEditingController();
  final TextEditingController Tag = TextEditingController();

  // final TextEditingController Account = TextEditingController();
  final TextEditingController gst = TextEditingController();
  final TextEditingController Tag1 = TextEditingController();

  // final TextEditingController Receipt1 = TextEditingController();
  // final TextEditingController Invoice1 = TextEditingController();
  final TextEditingController Vendor = TextEditingController();
  final TextEditingController Gst = TextEditingController();

  // final TextEditingController Vendor1 = TextEditingController();
  // final TextEditingController Gst1 = TextEditingController();

  Tabn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorLight,
          leading: GestureDetector(
              onTap: (){
                Get.toNamed(Routes.BOTTOM);
              },
              child: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark)),
          title:  Text(
            'Add Transaction'.tr,
            style:  TextStyle(
                fontSize: 20,color: Theme.of(context).primaryColorDark,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'How much?'.tr,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16),
              child: Opacity(
                opacity: 0.64,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller2,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                        fontSize: 38, color: Theme.of(context).primaryColor),
                    decoration:  InputDecoration(
                      hintText: "Enter amount \u{20B9}5578".tr,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 8,
            // ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: Theme.of(Get.context!).splashColor,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    TabBar(
                      controller: controller.tabController,
                      tabs: [
                        Tab(
                          height: 50,
                          icon: Container(
                            height: 100,
                            width: 200,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                            ),
                            child:  Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 7, left: 30, right: 30, bottom: 7),
                                child: Text(
                                  "Expenses".tr,
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          height: 50,
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration:
                                const BoxDecoration(color: Colors.green),
                            child:  Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 7, left: 30, right: 30, bottom: 7),
                                child: Text(
                                  "Income".tr,
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          // icon:
                        ),
                      ],
                      indicator: const BoxDecoration(
                        color: Colors.blue, // Set the color of the indicator
                      ),
                      labelColor: Colors.white,
                      // Set the color of the text/icon of the selected tab
                      unselectedLabelColor: Colors
                          .black12, // Set the color of the text/icon of the unselected tabs
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          _buildTabContent(),
                          _buildTabContent2(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    final TextEditingController paymentController = TextEditingController();
    final Rx<PaymentOptionexpense?> selectedPayment = Rx<PaymentOptionexpense?>(null);
    final TextEditingController paymentController1 = TextEditingController();
    final Rx<PaymentOption1?> selectedPayment1 = Rx<PaymentOption1?>(null);

    //new l
    final FlutterSecureStorage storage = const FlutterSecureStorage();
    RxList<String> savedCategories = <String>[].obs;

// Load saved categories
    Future<void> loadSavedCategories() async {
      final String? storedData = await storage.read(key: 'custom_categories');
      if (storedData != null && storedData.isNotEmpty) {
        savedCategories.value = storedData.split(',');
      }
    }

// Save new category
    Future<void> addCategory(String category) async {
      if (!savedCategories.contains(category) &&
          !PaymentOptionexpense.values.map((e) => e.toString().split('.').last).contains(category)) {
        savedCategories.add(category);
        await storage.write(key: 'custom_categories', value: savedCategories.join(','));
      }
    }

// Call this when the tab opens to load saved categories
    loadSavedCategories();
    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller1.selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != controller1.selectedDate.value) {
        controller1.updateSelectedDaten(picked);
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).unselectedWidgetColor,
      ),
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const SizedBox(
            height: 10,
          ),
          // Card(
          //   // color: Theme.of(Get.context!). cardColor,
          //   elevation: 10,
          //   shadowColor: Theme.of(Get.context!).splashColor,
          //   // margin:
          //   // EdgeInsets.all(10),
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //         left: 18, right: 16, top: 16, bottom: 16),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[Flexible(
          //           child: DropdownMenu<PaymentOptionexpense>(
          //             width: 0.8 * MediaQuery.of(Get.context!).size.width,
          //             initialSelection: PaymentOptionexpense.Food,
          //             controller: paymentController,
          //             requestFocusOnTap: true,
          //             label: const Text('Category ',style: TextStyle(fontFamily: 'Roboto'),),
          //             onSelected: selectedPayment.call,
          //             dropdownMenuEntries: PaymentOptionexpense.values
          //                 .map<DropdownMenuEntry<PaymentOptionexpense>>(
          //                   (PaymentOptionexpense option) =>
          //                       DropdownMenuEntry<PaymentOptionexpense>(
          //                     value: option,
          //                     label: option.toString().split('.').last,
          //                   ),
          //                 )
          //                 .toList(),
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 2,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 16, top: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Obx(() {
                      final List<String> allCategories = [
                        ...PaymentOptionexpense.values.map((e) => e.toString().split('.').last),
                        ...savedCategories
                      ];

                      return Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<String>.empty();
                          }
                          return allCategories.where((option) =>
                              option.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                        },
                        onSelected: (String selection) {
                          paymentController.text = selection;
                          addCategory(selection); // Save new category
                        },
                        fieldViewBuilder: (context, textEditingController, focusNode, onEditingComplete) {
                          return TextField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              labelText: 'Category',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              paymentController.text = value; // Allow new category
                            },
                            onEditingComplete: () {
                              addCategory(textEditingController.text); // Save new category
                            },
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            // margin:
            // EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                style: const TextStyle(fontFamily: 'Roboto'),
                controller: Receipt,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Theme.of(Get.context!).unselectedWidgetColor),
                  ),
                  hintText: 'Receipt No'.tr,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                style: const TextStyle(fontFamily: 'Roboto'),
                controller: Invoice,
                maxLines: 1,
                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Invoice Number'.tr,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                style: const TextStyle(fontFamily: 'Roboto'),
                maxLines: 5,
                controller: Des,
                decoration:  InputDecoration(
                  // contentPadding: const EdgeInsets.symmetric(
                  //     vertical: .0, horizontal: 20.0),
                  border: const OutlineInputBorder(),
                  hintText: 'Description'.tr,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding:  const EdgeInsets.all(20),
              child: TextFormField(
                style: const TextStyle(fontFamily: 'Roboto'),
                controller: Vendor,
                maxLines: 1,
                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Vendor Name'.tr,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                style: const TextStyle(fontFamily: 'Roboto'),
                controller: Gst,
                maxLines: 1,
                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'GST'.tr,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                style: const TextStyle(fontFamily: 'Roboto'),
                controller: Tag,
                maxLines: 1,
                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Tags'.tr,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 16, top: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: DropdownMenu<PaymentOption1>(
                      width: 0.8 * MediaQuery.of(Get.context!).size.width,
                      // menuHeight: 30,
                      initialSelection: PaymentOption1.Cash,
                      controller: paymentController1,
                      requestFocusOnTap: true,
                      enableSearch: true, // Ensures it allows typing
                      label: const Text('Account '),
                      onSelected: selectedPayment1.call,
                      dropdownMenuEntries: PaymentOption1.values
                          .map<DropdownMenuEntry<PaymentOption1>>(
                            (PaymentOption1 option) =>
                                DropdownMenuEntry<PaymentOption1>(
                              value: option,
                              label: option.toString().split('.').last,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(() {
                return TextFormField(
                  style: const TextStyle(fontFamily: 'Roboto'),
                  readOnly: true,
                  onTap: () => selectDate(Get.context!),
                  controller: TextEditingController(
                    text: "${controller1.selectedDate.value.toLocal()}".split(' ')[0],
                  ),
                  decoration:  InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Select Date'.tr,
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          IconButton(
            icon: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.attach_file),
                Text(
                  "Add Attachments",
                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                ),
              ],
            ),
            onPressed: () => _showBottomSheet(Get.context!),
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            color: Colors.grey[200],
            child: Center(child: _buildFileDisplay()),
          ),
          const SizedBox(
            height: 15,
          ),
          // Card(
          //   elevation: 10,
          //   child: Padding(
          //     padding:  EdgeInsets.all(20),
          //     child: TextFormField(
          //       maxLines: 2,
          //       decoration: const InputDecoration(
          //         border: OutlineInputBorder(),
          //         hintText: 'Pick your date',
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 15,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Theme.of(Get.context!).cardColor,
                ),
                onPressed: () async {
                  // await SecureStorage.setString(paymentController.text);
                  // if (_formKey.currentState!.validate()) {
                  _showSuccessDialog(Get.context!);
                  final tag = Tag.text;
                  final gst = Gst.text;
                  final account = paymentController1.text;
                  final vendor = Vendor.text;
                  final invoice = Invoice.text;
                  final receipt = Receipt.text;
                  final subTitle = Des.text;
                  final amount = controller2.text;
                  final time = controller1.selectedDate.value.toIso8601String();
                  final file = controller1.selectedFile.value;
                  String title = paymentController.text;
                  // final value = paymentController1.text;


                  if (title.isNotEmpty && amount.isNotEmpty && time.isNotEmpty
                      // && subTitle.isNotEmpty && amount.isNotEmpty && time.isNotEmpty
                      ) {

                    await controller1.writeExpenseToStorage(
                        title,
                        subTitle,
                        amount,
                        time,
                        gst,
                        receipt,
                        invoice,
                        vendor,
                        tag,
                        account,
                        file);
                    paymentController.clear();
                    // controller1.calculateAndSetDifference(title);

                    controller1.filteredItems();

                    await controller1.fetchTitlesFromStorage();
                    controller1.applyFilter();
                  }
                  // if (key.isNotEmpty && value.isNotEmpty) {
                  //   // Update secure storage and add new data to the list
                  //   controller.updateSecureStorage(key, value);
                  //   // Clear text fields
                  //   paymentController.clear();
                  //   paymentController1.clear();
                  // }
                },
                child:  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      'Continue'.tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    )))),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent2() {
    final TextEditingController paymentController = TextEditingController();
    final Rx<PaymentOptionincome?> selectedPayment = Rx<PaymentOptionincome?>(null);
    // final TextEditingController paymentController1 = TextEditingController();
    // final Rx<PaymentOption1?> selectedPayment1 = Rx<PaymentOption1?>(null);
    // final List<String> list = ['Option 1', 'Option 2', 'Option 3'];
    // String dropdownValue = list.first;
    // final List<String> list = <String>['Cash', 'Bank', 'Card'];
    // final List<String> list2 = <String>['Food', 'Transport', 'Education'];
    // late  RxString dropdownValue = list.first.obs;
    // late  RxString dropdownValue2 = list.first.obs;
    //new
    final FlutterSecureStorage storage = const FlutterSecureStorage();
    RxList<String> savedIncomeCategories = <String>[].obs;

// Load saved income categories
    Future<void> loadSavedIncomeCategories() async {
      final String? storedData = await storage.read(key: 'custom_income_categories');
      if (storedData != null && storedData.isNotEmpty) {
        savedIncomeCategories.value = storedData.split(',');
      }
    }

// Save new income category
    Future<void> addIncomeCategory(String category) async {
      if (!savedIncomeCategories.contains(category) &&
          !PaymentOptionincome.values.map((e) => e.toString().split('.').last).contains(category)) {
        savedIncomeCategories.add(category);
        await storage.write(key: 'custom_income_categories', value: savedIncomeCategories.join(','));
      }
    }

// Call this when the tab opens to load saved income categories
    loadSavedIncomeCategories();
    Future<void> selectDatefi(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller1.selectedDatefi.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != controller1.selectedDatefi.value) {
        controller1.updateSelectedDatefi(picked);
      }
    }
    return Container(
      decoration:
          BoxDecoration(color: Theme.of(Get.context!).unselectedWidgetColor),
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(
            height: 10,
          ),
          // Card(
          //   elevation: 10,
          //   shadowColor: Theme.of(Get.context!).splashColor,
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //         left: 16, right: 16, top: 16, bottom: 16),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Flexible(
          //           child: DropdownMenu<PaymentOptionincome>(
          //             width: 0.8 * MediaQuery.of(Get.context!).size.width,
          //             initialSelection: PaymentOptionincome.Cash,
          //             controller: paymentController,
          //             requestFocusOnTap: true,
          //             enableSearch: true,
          //             label: const Text('Category ',style: TextStyle(fontFamily: 'Roboto'),),
          //             onSelected: selectedPayment.call,
          //             dropdownMenuEntries: PaymentOptionincome.values
          //                 .map<DropdownMenuEntry<PaymentOptionincome>>(
          //                   (PaymentOptionincome option) =>
          //                       DropdownMenuEntry<PaymentOptionincome>(
          //                     value: option,
          //                     label: option.toString().split('.').last,
          //                   ),
          //                 )
          //                 .toList(),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 16, top: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Obx(() {
                      final List<String> allIncomeCategories = [
                        ...PaymentOptionincome.values.map((e) => e.toString().split('.').last),
                        ...savedIncomeCategories
                      ];

                      return Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<String>.empty();
                          }
                          return allIncomeCategories.where((option) =>
                              option.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                        },
                        onSelected: (String selection) {
                          paymentController.text = selection;
                          addIncomeCategory(selection); // Save new category
                        },
                        fieldViewBuilder: (context, textEditingController, focusNode, onEditingComplete) {
                          return TextField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              labelText: 'Category',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              paymentController.text = value; // Allow new category
                            },
                            onEditingComplete: () {
                              addIncomeCategory(textEditingController.text); // Save new category
                            },
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                style: const TextStyle(fontFamily: 'Roboto'),
                maxLines: 5,
                controller: Des1,
                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Description'.tr,
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 15,
          // ),
          // Card(
          //   elevation: 10,
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: TextFormField(
          //       controller: Vendor1,
          //       decoration: const InputDecoration(
          //         border: OutlineInputBorder(),
          //         hintText: 'Vendor Name',
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 15,
          // ),
          // Card(
          //   elevation: 10,
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: TextFormField(
          //       controller: Gst1,
          //       decoration: const InputDecoration(
          //         border: OutlineInputBorder(),
          //         hintText: 'GST',
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                style: const TextStyle(fontFamily: 'Roboto'),
                controller: Tag1,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Tags'.tr,
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 15,
          // ),
          // Card(
          //   elevation: 10,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 14,right: 18,top: 16,bottom: 16),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         DropdownMenu<PaymentOption1>(
          //           width: 0.8 * MediaQuery
          //               .of(Get.context!)
          //               .size
          //               .width,
          //           initialSelection: PaymentOption1.Cash,
          //           controller: paymentController1,
          //           requestFocusOnTap: true,
          //           label: const Text('Account'),
          //           onSelected: selectedPayment1.call,
          //           dropdownMenuEntries: PaymentOption1.values
          //               .map<DropdownMenuEntry<PaymentOption1>>(
          //                 (PaymentOption1 option) => DropdownMenuEntry<PaymentOption1>(
          //               value: option,
          //               label: option.toString().split('.').last,
          //             ),
          //           ).toList(),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 15,
          // ),
          // Card(
          //   elevation: 15,
          //   child: Padding(
          //     padding: const EdgeInsets.all(20),
          //     child: TextFormField(
          //       controller: Invoice1,
          //       decoration: const InputDecoration(
          //         border: OutlineInputBorder(),
          //         hintText: 'Invoice Number',
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 10,
            shadowColor: Theme.of(Get.context!).splashColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(() {
                return TextFormField(
                  style: const TextStyle(fontFamily: 'Roboto'),
                  readOnly: true,
                  onTap: () => selectDatefi(Get.context!),
                  controller: TextEditingController(
                    text: "${controller1.selectedDatefi.value.toLocal()}".split(' ')[0],
                  ),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Select Date'.tr,
                  ),
                );
              }),
            ),
          ),

          IconButton(
            icon:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.attach_file),
                Text(
                  "Add Attachments".tr,
                  style: const TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                ),
              ],
            ),
            onPressed: () => _showBottomSheet1(Get.context!),
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            color: Colors.grey[200],
            child: Center(child: _buildFileDisplay1()),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Theme.of(Get.context!).cardColor,
                ),
                onPressed: () async {

                  final tag = Tag1.text;
                  final subTitle = Des1.text;
                  final amount = controller2.text;
                  final time = controller1.selectedDatefi.value.toIso8601String();
                  final file = controller1.selectedFile1.value;
                  // final value = paymentController1.text;
                  String title = paymentController.text;

                  if (title.isNotEmpty && amount.isNotEmpty && time.isNotEmpty
                      // && subTitle.isNotEmpty && amount.isNotEmpty && time.isNotEmpty
                      ) {
                    await controller1.writeIncomeToStorage(
                        title, subTitle, amount, time, tag, file);


                    _showSuccessDialog1(Get.context!);
                    await controller1.fetchTitlesFromStorage1();
                    controller1.applyFilter();
                    controller1.filteredItems1();
                  }
                },
                child:  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      'Continue'.tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    )))),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    Get.bottomSheet(
      SizedBox(
        height: 0.3 * MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(
                'Pick Image from Camera',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Theme.of(context).primaryColor),
              ),
              onTap: () {
                controller1.pickImageFromCamera();
                // Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(
                'Pick Image from Gallery',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Theme.of(context).primaryColor),
              ),
              onTap: () {
                controller1.pickImageFromGallery();
                // Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file),
              title: Text(
                'Pick Document',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Theme.of(context).primaryColor),
              ),
              onTap: () {
                controller1.pickDocument();
                // Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet1(BuildContext context) {
    Get.bottomSheet(
      SizedBox(
        height: 0.3 * MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(
                'Pick Image from Camera',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Theme.of(context).primaryColor),
              ),
              onTap: () {
                controller1.pickImageFromCamera1();
                // Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(
                'Pick Image from Gallery',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Theme.of(context).primaryColor),
              ),
              onTap: () {
                controller1.pickImageFromGallery1();
                // Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file),
              title: Text(
                'Pick Document',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Theme.of(context).primaryColor),
              ),
              onTap: () {
                controller1.pickDocumenti();
                // Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileDisplay() {
    return Obx(() {
      final file = controller1.selectedFile.value;
      if (file == null) {
        return const Text("No file selected", style: TextStyle(fontFamily: 'Roboto'));
      } else {
        Widget fileDisplay;
        if (file.path.endsWith(".jpg") || file.path.endsWith(".png")) {
          fileDisplay = Image.file(file, fit: BoxFit.cover);
        } else {
          fileDisplay = Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey[200],
            child: Text("Selected Document: ${file.path.split('/').last}",style: const TextStyle(fontFamily: 'Roboto'),),
          );
        }
        return GestureDetector(
          onTap: () => controller1.downloadFile(file),
          child: fileDisplay,
        );
      }
    });
  }

  Widget _buildFileDisplay1() {
    return Obx(() {
      final file = controller1.selectedFile1.value;
      if (file == null) {
        return const Text("No file selected",style: TextStyle(fontFamily: 'Roboto'),);
      } else {
        Widget fileDisplay;
        if (file.path.endsWith(".jpg") || file.path.endsWith(".png")) {
          fileDisplay = Image.file(file, fit: BoxFit.cover);
        } else {
          fileDisplay = Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey[200],
            child: Text("Selected Document: ${file.path.split('/').last}",style: const TextStyle(fontFamily: 'Roboto'),),
          );
        }
        return GestureDetector(
          onTap: () => controller1.downloadFile(file),
          child: fileDisplay,
        );
      }
    });
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success',style: TextStyle(fontFamily: 'Roboto'),),
          content: const Text('Transaction has been successfully added!',style: TextStyle(fontFamily: 'Roboto'),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                 // Tag.clear();
                 // Gst.clear();
                 // Vendor.clear();
                 // Invoice.clear();
                 // Receipt.clear();
                 // Des.clear();
                 // controller2.clear();
                controller1.selectedFile.value = null;
              },
              child: const Text('OK',style: TextStyle(fontFamily: 'Roboto'),),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success',style: TextStyle(fontFamily: 'Roboto'),),
          content: const Text('Transaction has been successfully added!',style: TextStyle(fontFamily: 'Roboto'),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // paymentController.clear();
                // Tag1.clear();
                // Des1.clear();
                // controller2.clear();
                controller1.selectedFile1.value = null;

              },
              child: const Text('OK',style: TextStyle(fontFamily: 'Roboto'),),
            ),
          ],
        );
      },
    );
  }
}




