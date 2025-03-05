import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../customlisttile/views/customlisttile_view.dart';
import '../detailexpense/views/detailexpense_view.dart';
import '../detailincome/views/detailincome_view.dart';
import '../home/controllers/home_controller.dart';

class Somemoreview extends StatelessWidget {
  final HomeController hcontroller = Get.put(HomeController());

  Somemoreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 15),
                Text(
                  "All Based On Date".tr,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hcontroller.selectedDatee == null
                            ? 'Select Date For Expenses'.tr
                            : DateFormat('yyyy-MM-dd')
                                .format(hcontroller.selectedDatee!),
                        style: const TextStyle(
                            color: Colors.red, fontFamily: 'Roboto'),
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today,
                            color: Theme.of(context).cardColor),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (newDate != null) {
                            hcontroller.setSelectedDate(newDate);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(() {
              if (hcontroller.groupedItems.isEmpty) {
                return Center(
                    child: Text(
                  'No expenses added'.tr,
                  style: const TextStyle(fontFamily: 'Roboto'),
                ));
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: hcontroller.groupedItems.length,
                itemBuilder: (context, index) {
                  String dateGroup =
                      hcontroller.groupedItems.keys.elementAt(index);
                  List items = hcontroller.groupedItems[dateGroup]!;
                  return ExpansionTile(
                    title: Text(dateGroup),
                    children: List.generate(items.length, (itemIndex) {
                      var item = items[itemIndex];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailexpenseView(itemKey: item.key),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 15,
                            shadowColor: Theme.of(context).splashColor,
                            child: CustomListTile(
                              title: item.title,
                              subTitle: item.subTitle,
                              amount: item.amount,
                              time: hcontroller.formatDate(item.time),
                              account: '',
                              fileBase64: '',
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              );
            }),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          hcontroller.selectedDate3 == null
                              ? 'Select Date For Incomes'.tr
                              : DateFormat('yyyy-MM-dd')
                                  .format(hcontroller.selectedDate3!),
                          style: const TextStyle(
                              color: Colors.green, fontFamily: 'Roboto'),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                            color: Theme.of(context).cardColor,
                          ),
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (newDate != null) {
                              hcontroller.setSelectedDate1(newDate);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )),
            Obx(() {
              if (hcontroller.groupedItems1.isEmpty) {
                return const Center(
                    child: Text(
                  'No income added',
                  style: TextStyle(fontFamily: 'Roboto'),
                ));
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: hcontroller.groupedItems1.length,
                itemBuilder: (context, index) {
                  String dateGroup =
                      hcontroller.groupedItems1.keys.elementAt(index);
                  List items = hcontroller.groupedItems1[dateGroup]!;
                  return ExpansionTile(
                    title: Text(dateGroup),
                    children: List.generate(items.length, (itemIndex) {
                      var item = items[itemIndex];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailincomeView(itemKey: item.key),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 15,
                            shadowColor: Theme.of(context).splashColor,
                            child: CustomListTile1(
                              title: item.title,
                              subTitle: item.subTitle,
                              amount: item.amount,
                              time: hcontroller.formatDate(item.time),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
