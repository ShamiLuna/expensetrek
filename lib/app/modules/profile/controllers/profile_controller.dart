import 'dart:convert';
import 'dart:io';
import 'package:ExpenseTrek/app/services/encryption_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../signup/controllers/signupcontrollersecured.dart';
import '../../home/controllers/home_controller.dart';

class ProfileController extends GetxController {
  final EncryptionService encryptionService = EncryptionService();
  final SignupController signupController = Get.find<SignupController>();
  final HomeController homeController = Get.find<HomeController>();

  final Rx<XFile?> pickedImage = Rx<XFile?>(null);
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  var userName = ''.obs;
  var userEmail = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadProfileImage();
  }

  // 🔹 Export Transactions Only with Secure PIN
  Future<void> exportData() async {
    try {
      String? exportPin = await signupController.askUserForPin("Set a PIN for Backup");
      if (exportPin == null) return;

      // 🔹 Encrypt the PIN
      String encryptedPin = encryptionService.encryptData(exportPin);

      // 🔹 Fetch Stored Transactions (Exclude User Data)
      Map<String, String> allData = await _secureStorage.readAll();
      Map<String, String> filteredData = {};

      for (var key in allData.keys) {
        if (key.startsWith("expense_") || key.startsWith("income_")) {
          filteredData[key] = allData[key]!;
        }
      }

      filteredData["backup_pin"] = encryptedPin; // ✅ Store encrypted PIN

      // 🔹 Convert & Encrypt
      String jsonData = jsonEncode(filteredData);
      String encryptedData = encryptionService.encryptData(jsonData);

      // 🔹 Save File
      String? outputFilePath = await FilePicker.platform.saveFile(
        dialogTitle: "Save Backup File",
        fileName: "transactions_backup.enc",
      );

      if (outputFilePath != null) {
        await File(outputFilePath).writeAsString(encryptedData);
        print("✅ Transactions exported successfully: $outputFilePath");
      }
    } catch (e) {
      print("❌ Error exporting data: $e");
    }
  }

  // 🔹 Import Transactions and Merge with Existing Data
  Future<void> importData() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result == null) return;

      // 🔹 Read & Decrypt Data
      String encryptedData = await File(result.files.single.path!).readAsString();
      String jsonData = encryptionService.decryptData(encryptedData);
      Map<String, dynamic> importedData = jsonDecode(jsonData);

      // 🔹 Retrieve & Verify Backup PIN
      String? encryptedStoredPin = importedData["backup_pin"];
      if (encryptedStoredPin == null) {
        Get.snackbar("Invalid Backup", "The selected file does not have a PIN.");
        return;
      }

      String storedPin = encryptionService.decryptData(encryptedStoredPin);
      String? enteredPin = await signupController.askUserForPin("Enter Backup PIN");
      if (enteredPin != storedPin) {
        Get.snackbar("Incorrect PIN", "Import failed.");
        return;
      }

      // 🔹 Remove PIN from imported data
      importedData.remove("backup_pin");

      // 🔹 Merge Transactions into Secure Storage
      for (var key in importedData.keys) {
        await _secureStorage.write(key: key, value: importedData[key]);
      }

      // 🔹 Refresh Transaction List in HomeController
      await homeController.fetchTitlesFromStorage();
      await homeController.fetchTitlesFromStorage1();

      print("✅ Transactions imported and merged successfully");
    } catch (e) {
      print("❌ Error importing data: $e");
    }
  }

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
