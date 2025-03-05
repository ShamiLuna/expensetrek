import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:url_launcher/url_launcher.dart';

import 'helpcontroller.dart';

class HelpPage extends GetView<HelpController> {
  final String emailAddress = 'flutterappdevelopershamina@.com';

  const HelpPage({super.key});

  void _launchEmailApp(String emailAddress) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch email app';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title:  const Text('Help',style: TextStyle(fontFamily: 'Roboto',fontSize: 18,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Need Help?',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
               const Text(
                'If you have any questions, doubts, or suggestions for improvement, please feel free to contact us at:',style: TextStyle(fontSize: 16,fontFamily: 'Roboto'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  _launchEmailApp(emailAddress);
                },
                child: Text(
                  emailAddress,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.blue,
                    fontSize: 18.0,
                    decoration: TextDecoration.underline,
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

