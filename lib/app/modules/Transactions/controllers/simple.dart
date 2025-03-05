// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/transactions_controller.dart';
// import '../../home/controllers/home_controller.dart';
// import '../../detailexpense/views/detailexpense_view.dart';
// import '../../detailincome/views/detailincome_view.dart';
//
// class TransactionsView extends StatelessWidget {
//   final TransactionsController controller = Get.put(TransactionsController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Transactions'),
//         actions: [
//           Obx(() => DropdownButton<String>(
//             value: controller.selectedFilter.value,
//             items: ['Daily', 'Weekly', 'Monthly'].map((String filter) {
//               return DropdownMenuItem<String>(
//                 value: filter,
//                 child: Text(filter),
//               );
//             }).toList(),
//             onChanged: (newFilter) {
//               if (newFilter != null) {
//                 controller.selectedFilter.value = newFilter;
//                 controller.applyFilter();
//               }
//             },
//           )),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.filteredTransactions.isEmpty &&
//             controller.filteredIncomeTransactions.isEmpty) {
//           return const Center(
//             child: Text(
//               'No transactions available.',
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontStyle: FontStyle.italic,
//                 fontFamily: 'Roboto',
//               ),
//             ),
//           );
//         }
//         return ListView(
//           children: [
//             buildExpandableList('Expenses', controller.filteredTransactions, false),
//             buildExpandableList('Income', controller.filteredIncomeTransactions, true),
//           ],
//         );
//       }),
//     );
//   }
//
//   Widget buildExpandableList(String title, List<dynamic> items, bool isIncome) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//       child: ExpansionTile(
//         title: Text(
//           title,
//           style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
//         ),
//         children: items.map((item) => buildTransactionTile(item, isIncome)).toList(),
//       ),
//     );
//   }
//
//   Widget buildTransactionTile(dynamic item, bool isIncome) {
//     return ListTile(
//       title: Text(
//         item.title,
//         style: const TextStyle(fontFamily: 'Roboto'),
//       ),
//       subtitle: Text(
//         isIncome ? item.subTitle : item.vendor,
//         style: const TextStyle(fontFamily: 'Roboto'),
//       ),
//       trailing: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text(
//             (isIncome ? '+' : '-') + '₹${double.parse(item.amount).toStringAsFixed(2)}',
//             style: TextStyle(
//               color: isIncome ? Colors.green : Colors.red,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Roboto',
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             controller.controllerh.formatDate(item.time),
//             style: const TextStyle(fontFamily: 'Roboto'),
//           ),
//         ],
//       ),
//       onTap: () {
//         Get.to(() => isIncome
//             ? DetailincomeView(itemKey: item.key)
//             : DetailexpenseView(itemKey: item.key));
//       },
//     );
//   }
// }