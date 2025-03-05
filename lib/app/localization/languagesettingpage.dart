import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lang_controller.dart';

class LanguageSettingsPage extends StatelessWidget {
  final LanguageController _languageController = Get.put(LanguageController());

   LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: Theme.of(Get.context!).primaryColor)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Select Language'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(Get.context!).primaryColor,
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'English'.tr,
              style: TextStyle(
                color: Theme.of(Get.context!).primaryColor,
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            onTap: () {
              _languageController.changeLanguage('en', 'US');
            },
          ),
          ListTile(
            title: Text(
              'Spanish'.tr,
              style: TextStyle(
                color: Theme.of(Get.context!).primaryColor,
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            onTap: () {
              _languageController.changeLanguage('es', 'ES');
              print('english is selected');
            },
          ),
          ListTile(
            title: Text(
              'French'.tr,
              style: TextStyle(
                color: Theme.of(Get.context!).primaryColor,
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            onTap: () {
              _languageController.changeLanguage('fr', 'FR');
              print('French is selected');
            },
          ),
          ListTile(
            title: Text(
              'German'.tr,
              style: TextStyle(
                color: Theme.of(Get.context!).primaryColor,
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            onTap: () {
              _languageController.changeLanguage('de', 'DE');
              print('German is selected');
            },
          ),
          ListTile(
            title: Text(
              'Tamil'.tr,
              style: TextStyle(
                color: Theme.of(Get.context!).primaryColor,
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            onTap: () {
              _languageController.changeLanguage('ta', 'IN');
              print('Tamil is selected');
            },
          ),
        ],
      ),
    );
  }
}
