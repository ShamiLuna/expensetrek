import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../routes/app_pages.dart';
import '../../services/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 64,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Theme.of(context).primaryColorDark.withOpacity(0.1),Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5)],begin: Alignment.topLeft,end: Alignment.bottomRight,
              ),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      'Settings'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // To balance the back button
                ],
              ),
            ),
            const SizedBox(height: 10),
            buildThemeToggleListTile(context, themeProvider),
            const SizedBox(height: 10),
            buildThemeDropdownListTile(context, themeProvider),
            const SizedBox(height: 10),
            buildPrivacyListTile(context),
            const SizedBox(height: 10),
            buildAboutListTile(context),
            const SizedBox(height: 10),
            buildHelpListTile(context),
            const SizedBox(height: 10),
            // buildNotiListTile(context),
            // const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 34,
              padding: const EdgeInsets.only(top: 21, left: 121, right: 120, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 134,
                    height: 5,
                    decoration: ShapeDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildThemeToggleListTile(BuildContext context, ThemeProvider themeProvider) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        'Dark Mode',
        style: TextStyle(
          color: Theme.of(context).cardColor,
          fontSize: MediaQuery.of(context).size.width * 0.05,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
      trailing: Switch(
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          themeProvider.toggleTheme(value);
        },
      ),
    );
  }



  ListTile buildThemeDropdownListTile(BuildContext context, ThemeProvider themeProvider) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        'Select Theme',
        style: TextStyle(
          color: Theme.of(context).cardColor,
          fontSize: MediaQuery.of(context).size.width * 0.05,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios,color: Theme.of(context).primaryColor, size: 16),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ThemeSelectionPage(themeProvider: themeProvider),
          ),
        );
      },
    );
  }


  Widget buildPrivacyListTile(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PRIVACY);
        print('Privacy');
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          'Privacy'.tr,
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor, size: 16),
      ),
    );
  }

  Widget buildAboutListTile(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.ABOUT);
        print('About');
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          'About'.tr,
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor, size: 16),
      ),
    );
  }

  Widget buildHelpListTile(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.HELP);
        print('Help');
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          'Help'.tr,
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor, size: 16),
      ),
    );
  }

  Widget buildNotiListTile(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed(Routes.HELP);
        print('Notifications');
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          'Notifications'.tr,
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor, size: 16),
      ),
    );
  }
}
