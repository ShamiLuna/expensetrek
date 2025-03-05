import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'aboutcontroller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text('About', style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'App Overview:',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'The app is an offline financial management tool designed to track expenses and manage budgets based on income received.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Privacy and Security:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'The app prioritizes user privacy and security by storing financial data locally on the device, reducing the risk of unauthorized access.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Access Anytime, Anywhere:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Users can access their financial information anytime, anywhere, even without an internet connection, facilitating on-the-go financial management.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Customization:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'The tool is highly customizable, allowing users to tailor income and expense categorization to their unique financial needs.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'No Subscription Fees:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Unlike online finance tools, the app doesn\'t require recurring subscription fees, offering a cost-effective solution for users.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Offline Availability:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Users can manage finances offline, ideal for travel or areas with limited internet access.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Performance:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'The app offers fast performance without reliance on an internet connection, ensuring a seamless user experience.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'No Data Syncing Issues:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Unlike online tools, the app eliminates data syncing problems between devices.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data Control:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: 'Roboto'
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Users have complete control over their financial data storage and backup options, enhancing peace of mind.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
