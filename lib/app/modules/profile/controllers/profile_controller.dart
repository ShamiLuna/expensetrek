import 'dart:convert';
import 'dart:io';
import 'package:ExpenseTrek/app/services/encryption_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../signup/controllers/signupcontrollersecured.dart';

class ProfileController extends GetxController {
  final EncryptionService encryptionService = EncryptionService();
  final SignupController signupController = Get.find<SignupController>();
  final Rx<XFile?> pickedImage = Rx<XFile?>(null);
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  var userName = ''.obs;
  var userEmail = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadProfileImage();
  }
// 🔹 Export Data with Secure PIN
  Future<void> exportData() async {
    try {
      String? exportPin = await signupController.askUserForPin("Set a PIN for Backup");
      if (exportPin == null) return;

      // 🔹 Encrypt the PIN before storing it in the backup file
      String encryptedPin = encryptionService.encryptData(exportPin);

      // 🔹 Get Stored Data
      Map<String, String> allData = await _secureStorage.readAll();
      allData["backup_pin"] = encryptedPin; // ✅ Store encrypted PIN

      // 🔹 Convert & Encrypt Full Backup
      String jsonData = jsonEncode(allData);
      String encryptedData = encryptionService.encryptData(jsonData);

      // 🔹 Save File
      String? outputFilePath = await FilePicker.platform.saveFile(
        dialogTitle: "Save Backup File",
        fileName: "backup.enc",
      );

      if (outputFilePath != null) {
        await File(outputFilePath).writeAsString(encryptedData);
        print("✅ Data exported successfully: $outputFilePath");
      }
    } catch (e) {
      print("❌ Error exporting data: $e");
    }
  }

// 🔹 Import Data with PIN Verification
  Future<void> importData() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result == null) return;

      // 🔹 Read & Decrypt Data
      String encryptedData = await File(result.files.single.path!).readAsString();
      String jsonData = encryptionService.decryptData(encryptedData);
      Map<String, dynamic> importedData = jsonDecode(jsonData);

      // 🔹 Retrieve and Decrypt the Stored Backup PIN
      String? encryptedStoredPin = importedData["backup_pin"];
      if (encryptedStoredPin == null) {
        Get.snackbar("Invalid Backup", "The selected file does not have a PIN.");
        return;
      }

      String storedPin = encryptionService.decryptData(encryptedStoredPin);

      // 🔹 Ask User for PIN
      String? enteredPin = await signupController.askUserForPin("Enter Backup PIN");
      if (enteredPin != storedPin) {
        Get.snackbar("Incorrect PIN", "Import failed.");
        return;
      }

      // 🔹 Restore Data
      importedData.remove("backup_pin"); // Remove PIN from import
      for (var key in importedData.keys) {
        await _secureStorage.write(key: key, value: importedData[key]);
      }

      print("✅ Data restored successfully");
    } catch (e) {
      print("❌ Error importing data: $e");
    }
  }

  // // 🔹 Export Data with Secure PIN
  // Future<void> exportData() async {
  //   try {
  //     String? exportPin = await signupController.askUserForPin("Set a PIN for Backup");
  //     if (exportPin == null) return;
  //
  //     // 🔹 Get Stored Data
  //     Map<String, String> allData = await _secureStorage.readAll();
  //     allData["backup_pin"] = exportPin; // Store PIN inside the backup file
  //
  //     // 🔹 Convert & Encrypt
  //     String jsonData = jsonEncode(allData);
  //     String encryptedData = encryptionService.encryptData(jsonData);
  //
  //     // 🔹 Save File
  //     String? outputFilePath = await FilePicker.platform.saveFile(
  //       dialogTitle: "Save Backup File",
  //       fileName: "backup.enc",
  //     );
  //
  //     if (outputFilePath != null) {
  //       await File(outputFilePath).writeAsString(encryptedData);
  //       print("✅ Data exported successfully: $outputFilePath");
  //     }
  //   } catch (e) {
  //     print("❌ Error exporting data: $e");
  //   }
  // }
  //
  // // 🔹 Import Data with PIN Verification
  // Future<void> importData() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles();
  //     if (result == null) return;
  //
  //     // 🔹 Read & Decrypt Data
  //     String encryptedData = await File(result.files.single.path!).readAsString();
  //     String jsonData = encryptionService.decryptData(encryptedData);
  //     Map<String, dynamic> importedData = jsonDecode(jsonData);
  //
  //     // 🔹 Check Stored PIN
  //     String? storedPin = importedData["backup_pin"];
  //     if (storedPin == null) {
  //       Get.snackbar("Invalid Backup", "The selected file does not have a PIN.");
  //       return;
  //     }
  //
  //     // 🔹 Ask for PIN
  //     String? enteredPin = await signupController.askUserForPin("Enter Backup PIN");
  //     if (enteredPin != storedPin) {
  //       Get.snackbar("Incorrect PIN", "Import failed.");
  //       return;
  //     }
  //
  //     // 🔹 Restore Data
  //     importedData.remove("backup_pin");
  //     for (var key in importedData.keys) {
  //       await _secureStorage.write(key: key, value: importedData[key]);
  //     }
  //
  //     print("✅ Data restored successfully");
  //   } catch (e) {
  //     print("❌ Error importing data: $e");
  //   }
  // }

  // 🔹 Pick Profile Image
  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      pickedImage.value = image;
      await signupController.storeProfileImage(image.path);
    }
  }

  // 🔹 Load Profile Image
  Future<void> _loadProfileImage() async {
    final imagePath = await signupController.getProfileImage();
    if (imagePath != null) {
      pickedImage.value = XFile(imagePath);
    }
  }

  // 🔹 Logout and Clear Data
  Future<void> logout() async {
    await signupController.logout();
  }
}
