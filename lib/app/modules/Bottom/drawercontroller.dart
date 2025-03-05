import 'package:flutter/material.dart';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';



class MyDrawerController extends GetxController {
  final advancedDrawerController = AdvancedDrawerController();
}







class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(30),
        // borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
        color: Theme.of(context).primaryColorLight,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.find<MyDrawerController>().advancedDrawerController.hideDrawer();
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.find<MyDrawerController>().advancedDrawerController.hideDrawer();
              Get.toNamed(Routes.SETTING);
            },
          ),
          // Add more items here
        ],
      ),
    );
  }
}
