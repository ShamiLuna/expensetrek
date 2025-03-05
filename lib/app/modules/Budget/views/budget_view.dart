// import 'package:expensetrek/app/routes/app_pages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../customlisttile/views/customlisttile_view.dart';
// import '../../home/controllers/home_controller.dart';
// import '../controllers/budget_controller.dart';
//
// // class BudgetView extends GetView<BudgetController> {
// //   @override
// //   final HomeController controllerh = Get.put(HomeController());
// //   final BudgetController controller = Get.put(BudgetController());
// //    BudgetView({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         backgroundColor: Theme.of(context).cardColor,
// //         body: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: SizedBox(
// //                 height: 150,
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     IconButton(
// //                       icon: Icon(Icons.arrow_back_ios, size: 40, color: Theme.of(context).primaryColorLight),
// //                       onPressed: () => controllerh.previousMonth(),
// //                     ),
// //                     Obx(() {
// //                       return Text(
// //                         DateFormat('MMMM').format(controllerh.currentMonth.value),
// //                         style: TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 40),
// //                       );
// //                     }),
// //                     IconButton(
// //                       icon: Icon(Icons.arrow_forward_ios, size: 40, color: Theme.of(context).primaryColorLight),
// //                       onPressed: () => controllerh.nextMonth(),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             Expanded(
// //               child: Container(
// //                 decoration: BoxDecoration(
// //                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0),
// //                     topRight: Radius.circular(20.0),),
// //                   color: Theme.of(context).primaryColorLight,
// //                 ),
// //                 child: ListView(
// //                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: [
// //                     Obx(() {
// //                       if (controllerh.filteredBitems.isEmpty) {
// //                         return const Center(
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               Padding(
// //                                 padding: EdgeInsets.all(15.0),
// //                                 child: Text(
// //                                   'You don’t have a budget.\nLet’s make one so you are in control',
// //                                   style: TextStyle(
// //                                     fontFamily: 'Roboto',
// //                                     fontSize: 16,
// //                                     color: Colors.grey,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         );
// //                       } else {
// //                         return NotificationListener<ScrollNotification>(
// //                           onNotification: (scrollNotification) {
// //                             return false;
// //                           },
// //                           child: ListView.builder(
// //                             physics: const BouncingScrollPhysics(),
// //                             shrinkWrap: true,
// //                             itemCount: controllerh.filteredBitems.length,
// //                             itemBuilder: (context, index) {
// //                               final bitem = controllerh.filteredBitems[index];
// //                               var differenceData = controllerh.calculateAndSetDifference(bitem.title);
// //                               double differenceAmount = differenceData['differenceAmount'] ?? 0.0;
// //                               double ina = differenceData['ina'] ?? 0.0;
// //                               return Slidable(
// //                                 key: Key(bitem.key),
// //                                 startActionPane: ActionPane(
// //                                   motion: const ScrollMotion(),
// //                                   children: [
// //                                     SlidableAction(
// //                                       onPressed: (context) async {
// //                                         controllerh.deletebTitleFromStorage(bitem.key);
// //                                       },
// //                                       backgroundColor: Colors.red,
// //                                       foregroundColor: Colors.white,
// //                                       icon: Icons.delete,
// //                                       label: 'Delete',
// //                                     ),
// //                                   ],
// //                                 ),
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(8.0),
// //                                   child: ShoppingTransactions(
// //                                     title: bitem.title,
// //                                     subTitle: 'Remaining \u{20B9}${differenceAmount.toStringAsFixed(2)}',
// //                                     amount: '\u{20B9}${ina.toStringAsFixed(2)} of \u{20B9}${bitem.amount}',
// //                                     time: '',
// //                                     differenceProportion: controllerh.differenceProportion.value,
// //                                   ),
// //                                 ),
// //                               );
// //                             },
// //                           ),
// //                         );
// //                       }
// //                     }),
// //                     Align(
// //                        alignment: Alignment.bottomCenter,
// //                        child: Padding(
// //                          padding: const EdgeInsets.all(8.0),
// //                          child: ElevatedButton(
// //                              style: ElevatedButton.styleFrom(
// //                                shape: RoundedRectangleBorder(
// //                                  borderRadius: BorderRadius.circular(20.0),
// //                                ),
// //                                backgroundColor: Theme.of(context).cardColor,
// //                              ),
// //                              onPressed: (){
// //                                Get.toNamed(Routes.C_BUDGET);
// //                                // _showSuccessDialog(context);
// //                                // Allset();
// //                                // Mail();
// //                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const Create()));
// //                              }, child: const SizedBox(
// //                              height: 56,
// //                              width: double.infinity,
// //                              child: Center(child: Text('Create a budget',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Roboto',fontWeight: FontWeight.bold),)))),
// //                        ),
// //                      ),
// //
// //
// //                   ],
// //                 ),
// //
// //
// //               ),
// //             ),
// //
// //
// //           ],
// //         ),
// //
// //       ),
// //     );
// //   }
// // }
// class BudgetView extends GetView<BudgetController> {
//   @override
//   final HomeController controllerh = Get.put(HomeController());
//   final BudgetController controller = Get.put(BudgetController());
//
//   BudgetView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Theme.of(context).cardColor,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SizedBox(
//                 height: 150,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back_ios, size: 40, color: Theme.of(context).primaryColorLight),
//                       onPressed: () => controllerh.previousMonth(),
//                     ),
//                     Obx(() {
//                       return Text(
//                         DateFormat('MMMM yyyy').format(controllerh.currentMonth.value),
//                         style: TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 40),
//                       );
//                     }),
//                     IconButton(
//                       icon: Icon(Icons.arrow_forward_ios, size: 40, color: Theme.of(context).primaryColorLight),
//                       onPressed: () => controllerh.nextMonth(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
//                   color: Theme.of(context).primaryColorLight,
//                 ),
//                 child: Obx(() {
//                   if (controllerh.filteredBitems.isEmpty) {
//                     return const Center(
//                       child: Text(
//                         'You don’t have a budget.\nLet’s make one so you are in control',
//                         style: TextStyle(
//                           fontFamily: 'Roboto',
//                           fontSize: 16,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     );
//                   } else {
//                     return ListView.builder(
//                       physics: const BouncingScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: controllerh.filteredBitems.length,
//                       itemBuilder: (context, index) {
//                         final bitem = controllerh.filteredBitems[index];
//                         var differenceData = controllerh.calculateAndSetDifference(bitem.title);
//                         double differenceAmount = differenceData['differenceAmount'] ?? 0.0;
//                         double ina = differenceData['ina'] ?? 0.0;
//                         return Slidable(
//                           key: Key(bitem.key),
//                           startActionPane: ActionPane(
//                             motion: const ScrollMotion(),
//                             children: [
//                               SlidableAction(
//                                 onPressed: (context) async {
//                                   controllerh.deletebTitleFromStorage(bitem.key);
//                                 },
//                                 backgroundColor: Colors.red,
//                                 foregroundColor: Colors.white,
//                                 icon: Icons.delete,
//                                 label: 'Delete',
//                               ),
//                             ],
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ShoppingTransactions(
//                               title: bitem.title,
//                               subTitle: 'Remaining \u{20B9}${differenceAmount.toStringAsFixed(2)}',
//                               amount: '\u{20B9}${ina.toStringAsFixed(2)} of \u{20B9}${bitem.amount}',
//                               time: '',
//                               differenceProportion: controllerh.differenceProportion.value,
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 }),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     backgroundColor: Theme.of(context).cardColor,
//                   ),
//                   onPressed: () {
//                     Get.toNamed(Routes.C_BUDGET);
//                   },
//                   child: const SizedBox(
//                     height: 56,
//                     width: double.infinity,
//                     child: Center(
//                       child: Text(
//                         'Create a budget',
//                         style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
import '../../customlisttile/views/customlisttile_view.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/budget_controller.dart';

class BudgetView extends GetView<BudgetController> {
  @override
  final HomeController controllerh = Get.put(HomeController());
  @override
  final BudgetController controller = Get.put(BudgetController());

  BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Theme.of(context).primaryColorDark.withOpacity(0.5),Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5)],begin: Alignment.topCenter,end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                            size: 40, color: Theme.of(context).scaffoldBackgroundColor),
                        onPressed: () => controllerh.previousMonth(),
                      ),
                      Obx(() {
                        return Expanded(
                          child: Center(
                            child: Text(
                              DateFormat('MMMM yyyy')
                                  .format(controllerh.currentMonth.value),
                              style: TextStyle(
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                  fontSize: MediaQuery.of(context).size.width * 0.10,
                                  overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                          ),
                        );
                      }),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                            size: 40, color: Theme.of(context).scaffoldBackgroundColor),
                        onPressed: () => controllerh.nextMonth(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Obx(() {
                    if (controllerh.filteredBitems.isEmpty) {
                      return Center(
                        child: Text(
                          'You don’t have a budget.\nLet’s make one so you are in control'
                              .tr,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controllerh.filteredBitems.length,
                        itemBuilder: (context, index) {
                          final bitem = controllerh.filteredBitems[index];
                          var differenceData =
                              controllerh.calculateAndSetDifference(
                                  bitem.title, controllerh.currentMonth.value);
                          double differenceAmount =
                              differenceData['differenceAmount'] ?? 0.0;
                          double ina = differenceData['ina'] ?? 0.0;

                          return Slidable(
                            key: Key(bitem.key),
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) async {
                                    controllerh
                                        .deletebTitleFromStorage(bitem.key);
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
                              child: ShoppingTransactions(
                                title: bitem.title,
                                subTitle:
                                    'Remaining \u{20B9}${differenceAmount.toStringAsFixed(2)}',
                                amount:
                                    '\u{20B9}${ina.toStringAsFixed(2)} of \u{20B9}${bitem.amount}',
                                time: '',
                                differenceProportion:
                                    controllerh.differenceProportion.value,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Theme.of(context).cardColor,
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.C_BUDGET);
                  },
                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Create a budget'.tr,
                        style: TextStyle(
                          color: Theme.of(Get.context!).primaryColorLight,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
