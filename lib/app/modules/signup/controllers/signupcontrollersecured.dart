import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/storage_repository.dart';
import '../../../services/encryption_service.dart';
import '../../../services/firebase_auth_service.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isShowPassword = false.obs;
  final isCheck = false.obs;
  final name = ''.obs;

  final AuthService _authService = AuthService();
  final SecureStorageService _storageService = SecureStorageService();
  final EncryptionService _encryptionService = EncryptionService();

  // ✅ Toggle Password Visibility
  void togglePasswordVisibility() {
    isShowPassword.value = !isShowPassword.value;
  }

  void toggleCheckbox() {
    isCheck.value = !isCheck.value;
  }
  // ✅ Signup User
  Future<String?> signUpUser(String name, String email, String password) async {
    String? userId = await _authService.signUpUser(email, password);
    if (userId != null) {
      await storeUserData(name, email, password);
    }
    return userId;
  }

  // ✅ Store User Data Securely
  Future<void> storeUserData(String name, String email, String password) async {
    await _storageService.storeData('name', name);
    await _storageService.storeData('email', email);
    await _storageService.storeData('password', password); // ✅ Store as plain text
  }


  // ✅ Retrieve User Data
  Future<void> getUserData() async {
    name.value = await _storageService.getData('name') ?? '';
    String? email = await _storageService.getData('email');
    String? password = await _storageService.getData('password'); // ✅ No decryption

    print('🔹 User data retrieved: ${name.value}, $email, [password]');
  }



// ✅ Helper Function: Check if a string is Base64 (Encrypted)
  bool isBase64(String str) {
    final base64Regex = RegExp(r'^[A-Za-z0-9+/]+={0,2}$');
    return base64Regex.hasMatch(str);
  }


// // ✅ Helper Function: Check if a string is Base64 (i.e., Encrypted)
//   bool isBase64(String str) {
//     final base64Regex = RegExp(r'^[A-Za-z0-9+/]+={0,2}$');
//     return base64Regex.hasMatch(str);
//   }


  // ✅ Check Email Exists
  Future<bool> checkEmailExists(String email) async {
    String? storedEmail = await _storageService.getData('email');
    return storedEmail == email;
  }

  // ✅ Check Password
  Future<bool> checkPassword(String email, String password) async {
    String? storedEmail = await _storageService.getData('email');
    String? storedPassword = await _storageService.getData('password'); // ✅ No decryption

    return storedEmail == email && storedPassword == password;
  }



  // ✅ Store Profile Image Path
  Future<void> storeProfileImage(String imagePath) async {
    await _storageService.storeData('profile_image', imagePath);
  }

  // ✅ Get Profile Image Path
  Future<String?> getProfileImage() async {
    return await _storageService.getData('profile_image');
  }

  // ✅ Ask User for PIN (for export/import)
  Future<String?> askUserForPin(String title) async {
    TextEditingController pinController = TextEditingController();
    String? enteredPin = await Get.dialog(
      AlertDialog(
        title: Text(title),
        content: TextField(
          controller: pinController,
          keyboardType: TextInputType.number,
          obscureText: true,
          decoration: const InputDecoration(labelText: "Enter 4-digit PIN"),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: null), // Cancel
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Get.back(result: pinController.text), // Confirm
            child: const Text("Confirm"),
          ),
        ],
      ),
    );

    if (enteredPin != null && enteredPin.length == 4) {
      return enteredPin;
    } else {
      Get.snackbar("Invalid PIN", "PIN must be 4 digits.");
      return null;
    }
  }

  // ✅ Logout & Clear Secure Storage
  Future<void> logout() async {
    await _storageService.clearAll();
    await _authService.logout();
    Get.offAllNamed('/login');
  }
}
