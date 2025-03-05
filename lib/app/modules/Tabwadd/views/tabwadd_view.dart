import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabwadd_controller.dart';

class TabwaddView extends GetView<TabwaddController> {
  const TabwaddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: const Text(
          'Add Transaction',
          style: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'How much?',
              style: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 35),
            child: TextFormField(
              decoration: InputDecoration(
                  icon: const Icon(Icons.account_balance_wallet_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // icon: Icon(Icons.person),
                  hintText: 'Bank A/c Name'
              ),
              // Text(
              //   'SignupView is working',
              //   style: TextStyle(fontSize: 20),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
