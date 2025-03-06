import 'package:encrypt/encrypt.dart' as encrypt;

// class EncryptionService {
//   static const String _encryptionKey = "16charSecretKey!"; // 16 characters required
//
//   // ✅ Encrypt Data
//   String encryptData(String plainText) {
//     final key = encrypt.Key.fromUtf8(_encryptionKey);
//     final iv = encrypt.IV.fromLength(16);
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//
//     final encrypted = encrypter.encrypt(plainText, iv: iv);
//     return encrypted.base64;
//   }
//
//   bool isBase64(String str) {
//     final base64Regex = RegExp(r'^[A-Za-z0-9+/]+={0,2}$');
//     return base64Regex.hasMatch(str);
//   }
//
//   String decryptData(String encryptedText) {
//     final key = encrypt.Key.fromUtf8(_encryptionKey);
//     final iv = encrypt.IV.fromLength(16);
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//
//     try {
//       if (!isBase64(encryptedText)) {
//         print("⚠️ Skipping decryption: Value is not encrypted.");
//         return encryptedText; // Return as-is if not encrypted
//       }
//       return encrypter.decrypt64(encryptedText, iv: iv);
//     } catch (e) {
//       print("❌ Decryption failed: $e");
//       return encryptedText; // Return original text instead of crashing
//     }
//   }
//
//
// }
import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:convert';

class EncryptionService {
  static const String _encryptionKey = "16charSecretKey!"; // 16 characters required
  final encrypt.Key key = encrypt.Key.fromUtf8(_encryptionKey);

  // ✅ Encrypt Data (Store IV with Encrypted Text)
  String encryptData(String plainText) {
    final iv = encrypt.IV.fromLength(16); // Generate a random IV
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final combined = base64.encode(iv.bytes + encrypted.bytes); // Prepend IV

    return combined;
  }

  // ✅ Decrypt Data (Extract IV before Decrypting)
  String decryptData(String encryptedText) {
    try {
      final encryptedBytes = base64.decode(encryptedText);

      if (encryptedBytes.length < 16) {
        print("⚠️ Skipping decryption: Invalid encrypted data.");
        return encryptedText;
      }

      final iv = encrypt.IV(encryptedBytes.sublist(0, 16)); // Extract IV
      final encryptedData = encrypt.Encrypted(encryptedBytes.sublist(16)); // Extract actual encrypted text
      final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

      return encrypter.decrypt(encryptedData, iv: iv);
    } catch (e) {
      print("❌ Decryption failed: $e");
      return encryptedText; // Return original text instead of crashing
    }
  }
}
