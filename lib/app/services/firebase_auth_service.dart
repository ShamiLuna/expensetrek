import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// class AuthService {
//   final FirebaseAuth _auth;
//   // ✅ Allow passing a mock FirebaseAuth for testing
//   AuthService({FirebaseAuth? firebaseAuth}) : _auth = firebaseAuth ?? FirebaseAuth.instance;
//   // ✅ Firebase Signup
//   Future<String?> signUpUser(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user?.uid;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'email-already-in-use') {
//         Get.snackbar("Error", "Email already registered. Try logging in.",
//             snackPosition: SnackPosition.BOTTOM);
//       } else {
//         Get.snackbar("Signup Error", e.message ?? "Signup failed",
//             snackPosition: SnackPosition.BOTTOM);
//       }
//       return null;
//     }
//   }
//
//   // ✅ Logout
//   Future<void> logout() async {
//     await _auth.signOut();
//   }
// }
class AuthService {
  final FirebaseAuth _auth;
  final void Function(String title, String message)? errorHandler;

  AuthService({FirebaseAuth? firebaseAuth, this.errorHandler})
      : _auth = firebaseAuth ?? FirebaseAuth.instance;

  // Future<String?> signUpUser(String email, String password) async {
  //   try {
  //     UserCredential userCredential =
  //     await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     return userCredential.user?.uid;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'email-already-in-use') {
  //       await logout(); // ✅ Log out if email already exists
  //       if (errorHandler != null) {
  //         errorHandler!("Signup Error", "Email already registered. Please use another email.");
  //       }
  //     } else {
  //       if (errorHandler != null) {
  //         errorHandler!("Signup Error", e.message ?? "Signup failed");
  //       }
  //     }
  //     return null;
  //   }
  // }
  Future<String?> signUpUser(String email, String password) async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        await logout(); // ✅ Log out if email already exists
        if (errorHandler != null) {
          errorHandler!("Signup Error", "Email already registered. Please use another email.");
        }
      } else {
        if (errorHandler != null) {
          errorHandler!("Signup Error", e.message ?? "Signup failed");
        }
      }
      return null;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
