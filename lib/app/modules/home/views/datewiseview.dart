// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// import '../../customlisttile/views/customlisttile_view.dart';
// import '../../detailexpense/views/detailexpense_view.dart';
// import '../../detailincome/views/detailincome_view.dart';
// import '../controllers/home_controller.dart';
//
// class ExpenseListView extends StatelessWidget {
//   final HomeController homeController = Get.put(HomeController());
//
//    ExpenseListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Obx(() {
//               return DropdownButton<DateTime>(
//                 hint: const Text('Select Date'),
//                 value: homeController.selectedDatee,
//                 items: homeController.items.map((item) {
//                   DateTime itemDate = DateTime.parse(item.time);
//                   return DropdownMenuItem<DateTime>(
//                     value: itemDate,
//                     child: Text(DateFormat('yyyy-MM-dd').format(itemDate)),
//                   );
//                 }).toSet().toList(),
//                 onChanged: (newDate) {
//                   homeController.setSelectedDate(newDate);
//                 },
//               );
//             }),
//           ),
//           Expanded(
//             child: Obx(() {
//               if (homeController.groupedItems.isEmpty) {
//                 return const Center(child: Text('No expenses added'));
//               }
//               return ListView.builder(
//                 itemCount: homeController.groupedItems.length,
//                 itemBuilder: (context, index) {
//                   String dateGroup = homeController.groupedItems.keys.elementAt(index);
//                   List items = homeController.groupedItems[dateGroup]!;
//                   return ExpansionTile(
//                     title: Text(dateGroup),
//                     children: List.generate(items.length, (itemIndex) {
//                       var item = items[itemIndex];
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailexpenseView(itemKey: item.key),
//                             ),
//                           );
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Card(
//                             elevation: 15,
//                             shadowColor: Theme.of(context).splashColor,
//                             child: CustomListTile(
//                               title: item.title,
//                               subTitle: item.subTitle,
//                               amount: item.amount,
//                               time: item.time,
//                               account: '', fileBase64: item.fileBase64,
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                   );
//                 },
//               );
//             }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Obx(() {
//               return DropdownButton<DateTime>(
//                 hint: const Text('Select Date'),
//                 value: homeController.selectedDate3,
//                 items: homeController.items1.map((item) {
//                   DateTime itemDate = DateTime.parse(item.time);
//                   return DropdownMenuItem<DateTime>(
//                     value: itemDate,
//                     child: Text(DateFormat('yyyy-MM-dd').format(itemDate)),
//                   );
//                 }).toSet().toList(),
//                 onChanged: (newDate) {
//                   homeController.setSelectedDate1(newDate);
//                 },
//               );
//             }),
//           ),
//           Expanded(
//             child: Obx(() {
//               if (homeController.groupedItems1.isEmpty) {
//                 return const Center(child: Text('No income added'));
//               }
//               return ListView.builder(
//                 itemCount: homeController.groupedItems1.length,
//                 itemBuilder: (context, index) {
//                   String dateGroup = homeController.groupedItems1.keys.elementAt(index);
//                   List items = homeController.groupedItems1[dateGroup]!;
//                   return ExpansionTile(
//                     title: Text(dateGroup),
//                     children: List.generate(items.length, (itemIndex) {
//                       var item = items[itemIndex];
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailincomeView(itemKey: item.key),
//                             ),
//                           );
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Card(
//                             elevation: 15,
//                             shadowColor: Theme.of(context).splashColor,
//                             child: CustomListTile(
//                               title: item.title,
//                               subTitle: item.subTitle,
//                               amount: item.amount,
//                               time: item.time,
//                               account: '',fileBase64: item.fileBase64,
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // class DetailexpenseView extends StatelessWidget {
// //   final String itemKey;
// //
// //   DetailexpenseView({required this.itemKey});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Implement the detailed view for the expense
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Expense Details'),
// //       ),
// //       body: Center(
// //         child: Text('Details for $itemKey'),
// //       ),
// //     );
// //   }
// // }
// //
// // class DetailincomeView extends StatelessWidget {
// //   final String itemKey;
// //
// //   DetailincomeView({required this.itemKey});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Implement the detailed view for the income
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Income Details'),
// //       ),
// //       body: Center(
// //         child: Text('Details for $itemKey'),
// //       ),
// //     );
// //   }
// // }
