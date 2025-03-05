import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
// import '../../services/secure_storage_service.dart';
import '../../routes/app_pages.dart';
import '../Againpin/controllers/againpin_controller.dart';
import '../profile/controllers/profile_controller.dart';

class SplashController extends GetxController {
  final SecureStorageServicepin _storageService = SecureStorageServicepin();

  @override
  void onInit() {
    super.onInit();
    checkForPin();
  }

  // Future<void> checkForPin() async {
  //   print("Starting app and checking for stored PIN...");
  //
  //   await Future.delayed(const Duration(seconds: 1)); // Simulate splash delay
  //
  //   final pin = await _storageService.getPin();
  //
  //   // ✅ Check if user is authenticated in Firebase
  //   if (FirebaseAuth.instance.currentUser == null) {
  //     print("🔄 User not logged in. Forcing Firebase Logout.");
  //     await FirebaseAuth.instance.signOut();
  //     Get.offAllNamed(Routes.ONBOARD);
  //     return;
  //   }
  //
  //   // ✅ If PIN exists, go directly to PIN screen
  //   if (pin != null) {
  //     print("🔐 PIN exists, navigating to ENTERPIN");
  //     Get.offAllNamed(Routes.ENTERPIN);
  //     return;
  //   }
  //
  //   // ✅ If PIN does NOT exist, ask user if they want to import data
  //   print("📜 No PIN, navigating to ONBOARD");
  //
  //   Future.delayed(Duration(milliseconds: 500), () {
  //     Get.defaultDialog(
  //       title: "Import Data?",
  //       middleText: "Would you like to restore your data from a backup?",
  //       textCancel: "No",
  //       textConfirm: "Import",
  //       onConfirm: () async {
  //         await Get.find<ProfileController>().importData();
  //         Get.back(); // Close dialog after importing
  //       },
  //     );
  //   });
  //
  //   Get.offAllNamed(Routes.ONBOARD);
  // }
  Future<void> checkForPin() async {
    print("Starting app and checking for stored PIN...");

    await Future.delayed(const Duration(seconds: 1)); // Simulate splash delay

    final pin = await _storageService.getPin();
    final user = FirebaseAuth.instance.currentUser;

    // ✅ If user is NOT logged in, force logout and go to onboarding
    if (user == null) {
      print("🔄 User not logged in. Forcing Firebase Logout.");
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(Routes.ONBOARD);
      return;
    }

    // ✅ If PIN exists, go directly to PIN screen
    if (pin != null) {
      print("🔐 PIN exists, navigating to ENTERPIN");
      Get.offAllNamed(Routes.ENTERPIN);
      return;
    }

    // ✅ If PIN does NOT exist, ask user if they want to import data
    print("📜 No PIN, navigating to ONBOARD");

    Future.delayed(const Duration(milliseconds: 500), () async {
      bool wantsToImport = await Get.defaultDialog(
        title: "Import Data?",
        middleText: "Would you like to restore your data from a backup?",
        textCancel: "No",
        textConfirm: "Import",
        onConfirm: () {
          Get.back(result: true); // User confirmed import
        },
        onCancel: () {
          Get.back(result: false); // User declined import
        },
      );

      if (wantsToImport) {
        try {
          final profileController = Get.put(ProfileController());
          await profileController.importData();
          print("✅ Data imported successfully!");
        } catch (e) {
          print("❌ Error importing data: $e");
        }
      }

      // ✅ After asking, proceed to onboarding
      Get.offAllNamed(Routes.ONBOARD);
    });
  }

}
