
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../../routes/app_pages.dart';
import '../../customlisttile/views/customlisttile_view.dart';
import '../../detailexpense/views/detailexpense_view.dart';
import '../../detailincome/views/detailincome_view.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/transactions_controller.dart';


const itemSize = 150.0;

class TransactionsView extends GetView<TransactionsController> {
 TransactionsView({super.key});
  final TransactionsController controllert = Get.put(TransactionsController());
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_rounded,
                        color: Theme.of(context).primaryColorDark),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.BOTTOM);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "  All Transactions".tr,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontFamily: 'Roboto',
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Obx(() => DropdownButton<String>(
                  value: controllert.selectedFilter.value,
                  items: ['Daily', 'Weekly', 'Monthly'].map((String filter) {
                    return DropdownMenuItem<String>(
                      value: filter,
                      child: Text(filter),
                    );
                  }).toList(),
                  onChanged: (newFilter) {
                    if (newFilter != null) {
                      controllert.selectedFilter.value = newFilter;
                      controllert.applyFilter();
                    }
                  },
                )),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 15.0, top: 8, bottom: 8),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.filter_list,
                          color: Theme.of(context).primaryColorDark),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return const BottomSheetContent();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Center(
              child: Column(
                children: [
                  const SingleChildScrollView(),
                  // SafeArea(
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       colors: [
                  //         Theme.of(context)
                  //             .scaffoldBackgroundColor
                  //             .withOpacity(0.5),
                  //         Theme.of(context).primaryColorDark.withOpacity(0.5)
                  //       ],
                  //       begin: Alignment.topCenter,
                  //       end: Alignment.bottomRight,
                  //     ),
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 15.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         GestureDetector(
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Icon(Icons.arrow_back_rounded,
                  //                 color: Theme.of(context).primaryColor),
                  //           ),
                  //           onTap: () {
                  //             Get.toNamed(Routes.BOTTOM);
                  //           },
                  //         ),
                  //         FittedBox(
                  //           fit: BoxFit.scaleDown,
                  //           child: Text(
                  //             "All Transactions".tr,
                  //             overflow: TextOverflow.ellipsis,
                  //             maxLines: 2,
                  //             style: TextStyle(
                  //                 color: Theme.of(context).primaryColor,
                  //                 fontFamily: 'Roboto',
                  //                 fontSize:
                  //                     MediaQuery.of(context).size.width * 0.04,
                  //                 fontWeight: FontWeight.w600),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //               right: 15.0, top: 8, bottom: 8),
                  //           child: Center(
                  //             child: IconButton(
                  //               icon: Row(
                  //                 mainAxisSize: MainAxisSize.min,
                  //                 children: [
                  //                   FittedBox(
                  //                       fit: BoxFit.scaleDown,
                  //                       child: Text(
                  //                         "Apply filter".tr,
                  //                         maxLines: 2,
                  //                         style: TextStyle(
                  //                             fontSize: MediaQuery.of(context)
                  //                                     .size
                  //                                     .width *
                  //                                 0.04,
                  //                             color: Theme.of(context)
                  //                                 .primaryColor,
                  //                             fontFamily: 'Roboto',
                  //                             fontWeight: FontWeight.w600
                  //                             // fontSize: 18
                  //                             ),
                  //                       )),
                  //                   const SizedBox(
                  //                     width: 5,
                  //                   ),
                  //                   Icon(Icons.filter_list,
                  //                       color: Theme.of(context).primaryColor),
                  //                 ],
                  //               ),
                  //               onPressed: () {
                  //                 showModalBottomSheet(
                  //                   context: context,
                  //                   builder: (BuildContext context) {
                  //                     return const BottomSheetContent();
                  //                   },
                  //                 );
                  //               },
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // ),
                  Obx(() {
                    if (controller.filteredTransactions.isEmpty &&
                        controller.filteredIncomeTransactions.isEmpty) {
                      return const Center(
                        child: Text(
                          'No transactions available.',
                          style: TextStyle(
                            color: Colors.blue,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      );
                    }
                    return ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [

                        buildExpandableList('Expenses', controllert.filteredTransactions, false),
                        buildExpandableList('Income', controllert.filteredIncomeTransactions, true),
                      ],
                    );
                  }),
                  Obx(
                        () {
                      if (controller.isFilterApplied.value) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.isListViewVisible.value =
                                  !controller.isListViewVisible.value;
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Text(
                                      "Filtered Expenses Based On Date",
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).cardColor,
                                      ),
                                    ),
                                    Icon(
                                      controller.isListViewVisible.value
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            controller.isListViewVisible.value
                                ? ListView(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              children: controller.filteredItems.map(
                                    (item) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Card(
                                      elevation: 4,
                                      shadowColor:
                                      Theme.of(context).splashColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(12.0),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailexpenseView(
                                                    itemKey: item.key,
                                                  ),
                                            ),
                                          );
                                        },
                                        child: ListTile(
                                          title: Text(
                                            item.title,
                                            style: const TextStyle(
                                                fontFamily: 'Roboto'),
                                          ),
                                          subtitle: Text(
                                            item.vendor,
                                            style: const TextStyle(
                                                fontFamily: 'Roboto'),
                                          ),
                                          trailing: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '-\u{20B9}${double.parse(item.amount).toStringAsFixed(2)}',
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily: 'Roboto'),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                controller
                                                    .formatDate(item.time),
                                                style: const TextStyle(
                                                    fontFamily: 'Roboto'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            )
                                : Container(
                              // child: Text("No items"),
                            ),
                            Divider(
                              indent: 30,
                              endIndent: 30,
                              color: Theme.of(context).splashColor,
                            ),
                          ],
                        );
                      } else {
                        return const Text(
                          'Expenses filter not selected for date',
                          style: TextStyle(
                            color: Colors.blue,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Roboto',
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    if (controller.isFilterAppliedm.value) {
                      var highestAmountItem = controller.getHighestAmountItem();
                      if (highestAmountItem != null) {
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "Highest amount spent on: ${highestAmountItem.title}",
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                onChanged: (value) {
                                  controller.titleFilter.value = value;
                                },
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // Text color
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Enter Category to filter expenses',
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[800],
                                      fontFamily: 'Roboto' // Label text color
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.red, // Border color
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      // Border color when enabled
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                      // Border color when focused
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 14),
                                  filled: true,
                                  fillColor: Colors.grey[200], // Background color
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: controller.applyTitleFilter,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red,
                                // Text color
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                // Button padding
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                                ),
                                elevation: 3, // Elevation shadow
                              ),
                              child: const Text(
                                'Filter Category',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            FilteredItemsList(
                              title: "Filtered Expenses Based On Month",
                              items: controller.filteredItemsm,
                              context: context,
                            ),
                          ],
                        );
                      } else {
                        return const Text(
                            'No expenses filtered for the selected month.',
                            style: TextStyle(
                                color: Colors.blue,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Roboto'));
                      }
                    } else {
                      return const Text('Expenses filter not selected for month',
                          style: TextStyle(
                              color: Colors.blue,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Roboto'));
                    }
                  }),
                  const SizedBox(height: 10),
                  Obx(
                        () {
                      if (controller.isFilterApplied1.value) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.isListViewVisiblei.value =
                                  !controller.isListViewVisiblei.value;
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Filtered Incomes Based On Date",
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .cardColor, // Changed color
                                      ),
                                    ),
                                    Icon(
                                      controller.isListViewVisiblei.value
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            controller.isListViewVisiblei.value
                                ? ListView(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              children: controller.filteredItems1.map(
                                    (item) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Card(
                                      elevation: 4,
                                      shadowColor: Theme.of(context)
                                          .splashColor, // Added elevation
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(12.0),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailincomeView(
                                                    itemKey: item.key,
                                                  ),
                                            ),
                                          );
                                        },
                                        child: ListTile(
                                          title: Text(
                                            item.title,
                                            style: const TextStyle(
                                                fontFamily: 'Roboto'),
                                          ),
                                          subtitle: Text(
                                            item.tag,
                                            style: const TextStyle(
                                                fontFamily: 'Roboto'),
                                          ),
                                          trailing: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '\u{20B9}${double.parse(item.amount).toStringAsFixed(2)}',
                                                style: const TextStyle(
                                                  color: Colors.green,
                                                  fontFamily: 'Roboto',
                                                  // Changed color
                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                controller
                                                    .formatDate(item.time),
                                                style: const TextStyle(
                                                    fontFamily: 'Roboto'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            )
                                : Container(
                              // child: Text("No items"),
                            ),
                            Divider(
                              indent: 30,
                              endIndent: 30,
                              color: Theme.of(context).splashColor,
                            ),
                          ],
                        );
                      } else {
                        return const Text('Income filter not selected for date',
                            style: TextStyle(
                                color: Colors.blue,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Roboto'));
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    if (controller.isFilterAppliedm1.value) {
                      var highestAmountItem1 = controller.getHighestAmountItem1();
                      if (highestAmountItem1 != null) {
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "Highest income earned on: ${highestAmountItem1.title}",
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                onChanged: (value) {
                                  controller.titleFilter1.value = value;
                                },
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  color: Colors.black, // Text color
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Enter Category to filter incomes',
                                  labelStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: Colors.grey[800],
                                    // Label text color
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.green, // Border color
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.green,
                                      // Border color when enabled
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                      // Border color when focused
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 14),
                                  filled: true,
                                  fillColor: Colors.grey[200], // Background color
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: controller.applyTitleFilter1,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green,
                                // Text color
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                // Button padding
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                                ),
                                elevation: 3, // Elevation shadow
                              ),
                              child: const Text(
                                'Filter Category',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                            const SizedBox(height: 10),
                            FilteredItemsList1(
                              title: "Filtered Incomes Based On Month",
                              items: controller.filteredItemsm1,
                              context: context,
                            ),
                          ],
                        );
                      } else {
                        return const Text(
                            'No incomes filtered for the selected month.',
                            style: TextStyle(
                                color: Colors.blue,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Roboto'));
                      }
                    } else {
                      return const Text('Income filter not selected for month',
                          style: TextStyle(
                              color: Colors.blue,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Roboto'));
                    }
                  }),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      controller.isExpensesListVisible.value =
                      !controller.isExpensesListVisible.value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "All Expenses".tr,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            controller.isExpensesListVisible.value
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                        () => controller.isExpensesListVisible.value
                        ? (controller.items.isEmpty
                        ? Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Lottie.asset(
                              'assets/images/nodata.json',
                              height: 200,
                              reverse: true,
                              repeat: true,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'No expenses was added'.tr,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                    )
                        : NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        return false;
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        // height: 300,
                        child: ListView.builder(
                          // controller: controller.scrollController,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.items.length,
                          itemBuilder: (context, index) {
                            final item = controller.items[index];
                            // final opacity = controller.getOpacity(index);
                            // final scale = controller.getScale(index);
                            return Slidable(
                              key: Key(item.key),
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) async {
                                      await controller
                                          .deleteTitleFromStorage(
                                          item.key);
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 15,
                                  shadowColor:
                                  Theme.of(context).splashColor,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailexpenseView(
                                                  itemKey: item.key),
                                        ),
                                      );
                                    },
                                    child: CustomListTile(
                                      title: item.title,
                                      subTitle: item.vendor,
                                      amount: item.amount,
                                      time: controller
                                          .formatDate(item.time),
                                      account: item.account,
                                      fileBase64: item.fileBase64,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ))
                        : Container(),
                  ),
                  Divider(
                    indent: 30,
                    endIndent: 30,
                    thickness: 1.5,
                    color: Theme.of(context).primaryColor,
                  ),
                  // All Income Section
                  GestureDetector(
                    onTap: () {
                      controller.isIncomeListVisible.value =
                      !controller.isIncomeListVisible.value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "All Income".tr,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            controller.isIncomeListVisible.value
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                        () => controller.isIncomeListVisible.value
                        ? (controller.items1.isEmpty
                        ? Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Lottie.asset(
                              'assets/images/nodata.json',
                              height: 200,
                              reverse: true,
                              repeat: true,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'No income was added'.tr,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                    )
                        : NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        return false;
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.items1.length,
                          itemBuilder: (context, index) {
                            final item = controller.items1[index];
                            return Slidable(
                              key: Key(item.key),
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) async {
                                      await controller
                                          .deleteTitleFromStorage1(
                                          item.key);
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 15,
                                  shadowColor:
                                  Theme.of(context).splashColor,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailincomeView(
                                                  itemKey: item.key),
                                        ),
                                      );
                                    },
                                    child: CustomListTile1(
                                      title: item.title,
                                      subTitle: item.tag,
                                      amount: item.amount,
                                      time: controller
                                          .formatDate(item.time),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ))
                        : Container(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
 Widget buildExpandableList(String title, List<dynamic> items, bool isIncome) {
   return Obx(() => Card(
     margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
     child: ExpansionTile(
       title: Text(
         title,
         style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
       ),
       children: items.map((item) => buildTransactionTile(item, isIncome)).toList(),
     ),
   ));
 }

 Widget buildTransactionTile(dynamic item, bool isIncome) {
   return ListTile(
     title: Text(
       item.title,
       style: const TextStyle(fontFamily: 'Roboto'),
     ),
     subtitle: Text(
       isIncome ? item.subTitle : item.vendor,
       style: const TextStyle(fontFamily: 'Roboto'),
     ),
     trailing: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.end,
       children: [
         Text(
           (isIncome ? '+' : '-') + '₹${double.parse(item.amount).toStringAsFixed(2)}',
           style: TextStyle(
             color: isIncome ? Colors.green : Colors.red,
             fontWeight: FontWeight.bold,
             fontFamily: 'Roboto',
           ),
         ),
         const SizedBox(height: 4),
         Text(
           controllert.controllerh.formatDate(item.time),
           style: const TextStyle(fontFamily: 'Roboto'),
         ),
       ],
     ),
     onTap: () {
       Get.to(() => isIncome
           ? DetailincomeView(itemKey: item.key)
           : DetailexpenseView(itemKey: item.key));
     },
   );
 }
}

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Card(
              elevation: 8,
              shadowColor: Theme.of(context).splashColor,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Filter By Particular Date".tr,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).cardColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DateFilterButton(
                        color: Colors.green,
                        iconPath: 'assets/images/ex.json',
                        label: "Income",
                        initialDate: controller.selectedDate2.value,
                        onDateSelected: (date) =>
                            controller.updateSelectedDate2(date),
                      ),
                      DateFilterButton(
                        color: Colors.red,
                        iconPath: 'assets/images/in.json',
                        label: "Expenses",
                        initialDate: controller.selectedDate1.value,
                        onDateSelected: (date) =>
                            controller.updateSelectedDate(date),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Divider(
              indent: 30,
              endIndent: 30,
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 8,
              shadowColor: Theme.of(context).splashColor,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Filter By Particular Month/Year".tr,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).cardColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                icon: Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.green,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Lottie.asset(
                                        'assets/images/ex.json',
                                        height: 25,
                                        reverse: true,
                                        repeat: true,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () async {
                                  DateTime? pickedDate1 = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate1 != null) {
                                    // controller.updatePickedDate1(pickedDate1);
                                    controller.pickedDate1.value = pickedDate1;
                                    controller
                                        .filterItemsByMonthYear1(pickedDate1);
                                  }
                                },
                              ),
                            ),
                          ),
                          Text(
                            "Income".tr,
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      // SizedBox(height: 16),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                icon: Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Lottie.asset(
                                        'assets/images/in.json',
                                        height: 25,
                                        reverse: true,
                                        repeat: true,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    // controller.updatePickedDate(pickedDate);
                                    controller.pickedDate.value = pickedDate;
                                    controller
                                        .filterItemsByMonthYear(pickedDate);
                                  }
                                },
                              ),
                            ),
                          ),
                          Text(
                            "Expenses".tr,
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Divider(
              indent: 30,
              endIndent: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class DateFilterButton extends StatelessWidget {
  final Color color;
  final String iconPath;
  final String label;
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const DateFilterButton({
    super.key,
    required this.color,
    required this.iconPath,
    required this.label,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: Row(
                children: [
                  Icon(Icons.calendar_today, color: color),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Lottie.asset(
                      iconPath,
                      height: 25,
                      reverse: true,
                      repeat: true,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: initialDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  onDateSelected(pickedDate);
                }
              },
            ),
          ),
        ),
        Text(
          label.tr,
          style: const TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class FilteredItemsList extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final String title;
  final List items;
  final BuildContext context;

  FilteredItemsList({
    super.key,
    required this.title,
    required this.items,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              controller.isListViewVisiblem.value =
              !controller.isListViewVisiblem.value;
            },
            child: Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                Icon(
                  controller.isListViewVisiblem.value
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
        Obx(
              () => controller.isListViewVisiblem.value
              ? ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      elevation: 8,
                      shadowColor: Theme.of(context).splashColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailexpenseView(itemKey: item.key),
                            ),
                          );
                        },
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          title: Text(
                            item.title,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            item.subTitle,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                            ),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\u{20B9}${double.parse(item.amount).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                formatDate(item.time),
                                style: const TextStyle(
                                    fontFamily: 'Roboto', fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
              : Container(),
        ),
        Divider(
          indent: 30,
          endIndent: 30,
          thickness: 1.5,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  String formatDate(String dateStr) {
    DateTime date = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(date);
  }
}

class FilteredItemsList1 extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final String title;
  final List items;
  final BuildContext context;

  FilteredItemsList1({
    super.key,
    required this.title,
    required this.items,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              controller.isListViewVisiblemi.value =
              !controller.isListViewVisiblemi.value;
            },
            child: Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                Icon(
                  controller.isListViewVisiblemi.value
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
        Obx(
              () => controller.isListViewVisiblemi.value
              ? ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      elevation: 8,
                      shadowColor: Theme.of(context).splashColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailincomeView(itemKey: item.key),
                            ),
                          );
                        },
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          title: Text(
                            item.title,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            item.subTitle,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                            ),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\u{20B9}${double.parse(item.amount).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                formatDate(item.time),
                                style: const TextStyle(
                                    fontFamily: 'Roboto', fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
              : Container(),
        ),
        Divider(
          indent: 30,
          endIndent: 30,
          thickness: 1.5,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  String formatDate(String dateStr) {
    DateTime date = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(date);
  }
}