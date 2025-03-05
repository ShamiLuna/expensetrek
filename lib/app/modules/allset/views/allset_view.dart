import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/theme_provider.dart';
import '../../onboard/views/onboard_view.dart';
import '../controllers/allset_controller.dart';
// Import the Botto screen

class AllsetView extends GetView<AllsetController> {
  const AllsetView({super.key});

  // const AllsetView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Adding post-frame callback to execute after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Delay navigation by 2 seconds (adjust as needed)
      Future.delayed(const Duration(seconds: 2), () {
        Botto(); // Navigate to Botto screen
      });
    });

    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          // Handle any tap events if needed
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Column(
                  children: [
                    MyAnimatedIcon( // Use MyAnimatedIcon here
                      animationPath: 'assets/Tick.json',
                      height: 250,
                      reverse: true,
                      repeat: true,
                      fit: BoxFit.cover,
                      themeProvider: ThemeProvider(), // Pass your theme provider instance
                      iconData: Icons.check,// Pass icon data here
                    ),
                    // Lottie.asset(
                    //   'assets/Tick.json',
                    //   height: 250,
                    //   reverse: true,
                    //   repeat: true,
                    //   fit: BoxFit.cover,
                    // ),
                    const Text(
                      'You are set!',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
