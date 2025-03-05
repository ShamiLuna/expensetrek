
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../routes/app_pages.dart';
import '../../customlisttile/views/customlisttile_view.dart';
import '../../detailexpense/views/detailexpense_view.dart';
import '../../detailincome/views/detailincome_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  final HomeController controller = Get.put(HomeController());
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final String _selectedType = 'Monthly';

  // final CustomlisttileController controllerr = Get.put(CustomlisttileController());
  List<String> items = [];
  List day = ['Day', 'Week', 'Month', 'Year'];

  HomeView({super.key});

  // List f = [today(), week(), month(), year()];
  // List<Add_data> a = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/mainimage.jpg'), fit: BoxFit.fill),
        // ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height:  MediaQuery.of(context).size.width *
                      0.60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).scaffoldBackgroundColor,
                        Theme.of(context).primaryColorDark,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [

                      const SizedBox(height: 26),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          'Account Balance'.tr,
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: MediaQuery.of(context).size.width *
                                0.06, // 5% of screen width,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          '\u{20B9} ${controller.balance.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width *
                                0.05, // 5% of screen width,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
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
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Income".tr,
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              // 5% of screen width,
                                              color: const Color(0xFF0E7A53),
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => Text(
                                            '\u{20B9} ${controller.totalAmount1.value.toStringAsFixed(2)}',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              // 5% of screen width,
                                              color: const Color(0xFF0E7A53),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
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
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Expenses".tr,
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              // 5% of screen width,
                                              color: const Color(0xFFC22727),
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => Text(
                                            '\u{20B9} ${controller.totalAmount.value.toStringAsFixed(2)}',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              // 5% of screen width,
                                              color: const Color(0xFFC22727),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text("Expenses analysis".tr,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: MediaQuery.of(context).size.width *
                            0.05, // 5% of screen width,
                        fontWeight: FontWeight.w600)),
                Obx(() {
                  if (controller.items.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Add Expenses through add button below.'.tr,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.05, // 5% of screen width,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    final pieChartData = controller.getPieChartData();
                    final displayedCategories = controller.items
                        .map((item) => item.title.toLowerCase())
                        .toSet();
                    final sortedCategories = controller.getSortedCategories();// Normalize to lowercase
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, top: 2, bottom: 2, right: 5),
                            child: SizedBox(
                              height: 250,
                              width: 250,
                              child: PieChart(
                                PieChartData(
                                  sections: pieChartData,
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 60,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, right: 16, bottom: 16),
                            child: SizedBox(
                              height: 250,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // children: displayedCategories.map((category) {
                                  //   Color color = controller
                                  //           .categoryColors[category] ??
                                  //       controller.getColorFromString(
                                  //           category); // Normalize to lowercase
                                  //   return Padding(
                                  //     padding: const EdgeInsets.symmetric(
                                  //         vertical: 4.0),
                                  //     child: Row(
                                  //       children: [
                                  //         Container(
                                  //           width: 20,
                                  //           height: 20,
                                  //           color: color,
                                  //         ),
                                  //         const SizedBox(width: 8),
                                  //         Expanded(
                                  //           child: Text(
                                  //             "${data["category"]} - ₹${data["amount"].toStringAsFixed(2)}",
                                  //             style: TextStyle(
                                  //               fontSize: MediaQuery.of(context)
                                  //                       .size
                                  //                       .width *
                                  //                   0.03,
                                  //               // 5% of screen width,
                                  //               overflow: TextOverflow.ellipsis,
                                  //               fontFamily: 'Roboto',
                                  //               fontWeight: FontWeight.normal,
                                  //             ),
                                  //             maxLines: 2,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   );
                                  // }).toList(),
                                  children: sortedCategories.map((categoryData) { // ✅ Correct variable name
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            color: categoryData["color"], // ✅ Correct variable name
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              "${categoryData["category"]} - ₹${categoryData["amount"].toStringAsFixed(2)}",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.03,
                                                overflow: TextOverflow.ellipsis,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.normal,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }),
                const SizedBox(
                  // height: 8,
                  width: 8,
                ),
                // NeonLine(),
                const SizedBox(
                  height: 8,
                  width: 8,
                ),
                Text("Income analysis".tr,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: MediaQuery.of(context).size.width *
                            0.05, // 5% of screen width,
                        fontWeight: FontWeight.w600)),
                Obx(() {
                  if (controller.items1.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Add Incomes through add button below.'.tr,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.05, // 5% of screen width,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    final pieChartData1 = controller.getPieChartData1();
                    final displayedCategories1 = controller.items1
                        .map((item) => item.title.toLowerCase())
                        .toSet(); // Normalize to lowercase
        
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, top: 2, bottom: 2, right: 5),
                            child: SizedBox(
                              height: 250,
                              width: 250,
                              child: PieChart(
                                PieChartData(
                                  sections: pieChartData1,
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 60,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, right: 16, bottom: 16),
                            child: SizedBox(
                              height: 250,
                              child:
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: controller.getSortedCategories1().map((category) {
                                    Color color = category["color"];
                                    String categoryName = category["category"];
                                    double amount = category["amount"];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            color: color,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              "$categoryName: ₹${amount.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context).size.width * 0.03,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }),
                const Divider(
                  indent: 30,
                  endIndent: 30,
                ),
                Text("Expenses analysis on linear chart ".tr,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: MediaQuery.of(context).size.width *
                            0.05, // 5% of screen width,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return DropdownButton<String>(
                    value: controller.selectedType.value,
                    items: ['Monthly', 'Daily', 'Yearly'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: MediaQuery.of(context).size.width *
                                0.05, // 5% of screen width,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .splashColor, // Added color from theme
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      if (newValue != null) {
                        controller.updateType(newValue);
                      }
                    },
                  );
                }),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).splashColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() {
                        if (controller.data.isEmpty) {
                          return Center(
                              child: Text(
                            'No data available'.tr,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: MediaQuery.of(context).size.width *
                                    0.05 // 5% of screen width
                                ),
                          ));
                        }
                        return SizedBox(
                          height: (controller.data.length * 80.0)
                              .clamp(400.0, double.infinity),
                          // Ensure minimum width// Adjust this value as needed
                          width: (controller.data.length * 120.0)
                              .clamp(400.0, double.infinity),
                          // Ensure minimum width
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DataChart(
                              data: controller.data,
                              type: controller.selectedType.value,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(
                  indent: 30,
                  endIndent: 30,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>  Somemoreview(),
                    //   ),
                    // );
                    Get.toNamed(Routes.SOMEMORE);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColorDark.withOpacity(0.5),
                            Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.5)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Theme.of(context).primaryColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "See on date basis".tr,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.05, // 5% of screen width,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Recent Transaction".tr,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: MediaQuery.of(context).size.width *
                                0.05, // 5% of screen width,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .cardColor, // Added color from theme
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.TRANSACTIONS);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const TransactionsView(),
                        //   ),
                        // );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).cardColor.withOpacity(0.5),
                                Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withOpacity(0.5)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "See All".tr,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.05, // 5% of screen width,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  color: Theme.of(context)
                                      .primaryColor, // Added color from theme
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          "Expenses".tr,
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontFamily: 'Roboto',
                            fontSize: MediaQuery.of(context).size.width *
                                0.05, // 5% of screen width,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  if (controller.items.isEmpty) {
                    return Center(
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
                            'No expenses were added'.tr,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: MediaQuery.of(context).size.width *
                                  0.05, // 5% of screen width,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        return false;
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.items.length >= 5
                                ? 5
                                : controller.items.length,
                            itemBuilder: (context, index) {
                              final item = controller.items[index];
                              return Slidable(
                                key: Key(item.key),
                                startActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) async {
                                        await controller
                                            .deleteTitleFromStorage(item.key);
                                      },
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailexpenseView(
                                            itemKey: item.key),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 15,
                                      shadowColor:
                                          Theme.of(context).splashColor,
                                      child: CustomListTile(
                                        title: item.title,
                                        subTitle: item.subTitle,
                                        amount: item.amount,
                                        time: controller.formatDate(item.time),
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
                      ),
                    );
                  }
                }),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          "Income".tr,
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontFamily: 'Roboto',
                            fontSize: MediaQuery.of(context).size.width *
                                0.05, // 5% of screen width,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  if (controller.items1.isEmpty) {
                    return Center(
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
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: MediaQuery.of(context).size.width *
                                  0.05, // 5% of screen width,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        return false;
                      },
                      child: SizedBox(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.items1.length >= 5
                                ? 5
                                : controller.items1.length,
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
                                            .deleteTitleFromStorage1(item.key);
                                      },
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 15,
                                      shadowColor:
                                          Theme.of(context).splashColor,
                                      child: CustomListTile1(
                                        title: item.title,
                                        subTitle: item.tag,
                                        amount: item.amount,
                                        time: controller.formatDate(item.time),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }
                }),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Modele {
  String? image;
  String? text;

  Modele(this.image, this.text);
}

List thug = modeleData.map((e) => Modele(e["image"], e["text"])).toList();

var modeleData = [
  {"image": "assets/Shop.png", "text": "Shopping"},
  {"image": "assets/Subscrip.png", "text": "Subscription"},
  {"image": "assets/Food.png", "text": "Food"},

];



///linear
class DataChart extends StatelessWidget {
  final Map<String, double> data;
  final String type;

  const DataChart({super.key, required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = [];
    List<String> keys = data.keys.toList()..sort();

    for (int i = 0; i < keys.length; i++) {
      spots.add(FlSpot(i.toDouble(), data[keys[i]]!));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: keys.length * 100.0,
            width: keys.length * 120.0, // Adjust this value as needed
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: (keys.length - 1).toDouble(),
                minY: data.values.reduce((a, b) => a < b ? a : b),
                maxY: data.values.reduce((a, b) => a > b ? a : b),
                gridData: const FlGridData(show: true),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                      // sideTitles: SideTitles(showTitles: true, interval: 1,reservedSize: 44),
                      ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 44,
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() < keys.length) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(keys[value.toInt()]),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border:
                      Border.all(color: const Color(0xff37434d), width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: Theme.of(context).cardColor,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Theme.of(context).cardColor.withOpacity(0.3),
                    ),
                    dotData: const FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NeonLine extends StatelessWidget {
  const NeonLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 4.0, // Thickness of the neon line
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.cyan,
            Colors.blue,
            Colors.purple,
            Colors.pink,
            Colors.red,
            Colors.orange,
            Colors.yellow,
          ],
          stops: [
            0.0,
            0.2,
            0.4,
            0.6,
            0.8,
            1.0,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.6),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }
}
