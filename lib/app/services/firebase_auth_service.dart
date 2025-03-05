import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ✅ Firebase Signup
  Future<String?> signUpUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "Email already registered. Try logging in.",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Signup Error", e.message ?? "Signup failed",
            snackPosition: SnackPosition.BOTTOM);
      }
      return null;
    }
  }

  // ✅ Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
