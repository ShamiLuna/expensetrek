import 'package:ExpenseTrek/app/modules/Splash%20screen/splashcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:expensetrek/services/secure_storage_service.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({Key? key}) : super(key: key);
//
//   @override
//   _SplashViewState createState() => _SplashViewState();
// }

class SplashView extends GetView<SplashController>{
  const SplashView({super.key});

  // @override
  // void initState() {
  //   super.initState();
  //   _checkLoggedIn();
  // }
  //
  // Future<void> _checkLoggedIn() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   final isLoggedIn = await SecureStorageService().isLoggedIn();
  //   // if (isLoggedIn) {
  //   //   Get.offNamed(Routes.ENTERPIN);
  //   // } else {
  //   //   Get.offNamed(Routes.ONBOARD);
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor, // Replace with your desired color
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Image.asset('assets/images/logo.jpeg'),
                ), // Replace with your logo path
                const Text(
                  'Finance App',
                  style: TextStyle(fontSize: 24.0, color: Colors.white,fontFamily: 'Roboto'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
