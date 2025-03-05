
import 'package:ExpenseTrek/app/modules/Privacy%20policy/privacycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyPage extends GetView<Privacycontroller> {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text('Privacy Policy',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold),),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'We are committed to protecting your privacy. We do not collect any personal information through this app. All data stays on your device and is not shared with any third party.',
              style: TextStyle(fontSize: 16.0,fontFamily: 'Roboto'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data Usage',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "This is an offline app and does not require any internet connection. Therefore, no data is transmitted from your device to any external server .",
              style: TextStyle(fontSize: 16.0,fontFamily: 'Roboto'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Stored data',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "The provided data will be securely formatted with unique secret codes generated each time. It remains inaccessible to device internal storage, ensuring data confidentiality during storage access.",
              style: TextStyle(fontSize: 16.0,fontFamily: 'Roboto'),
            ),
          ],
        ),
      ),
    );
  }
}


