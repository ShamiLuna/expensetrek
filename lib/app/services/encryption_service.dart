import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionService {
  static const String _encryptionKey = "16charSecretKey!"; // 16 characters required

  // ✅ Encrypt Data
  String encryptData(String plainText) {
    final key = encrypt.Key.fromUtf8(_encryptionKey);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  bool isBase64(String str) {
    final base64Regex = RegExp(r'^[A-Za-z0-9+/]+={0,2}$');
    return base64Regex.hasMatch(str);
  }

  String decryptData(String encryptedText) {
    final key = encrypt.Key.fromUtf8(_encryptionKey);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    try {
      if (!isBase64(encryptedText)) {
        print("⚠️ Skipping decryption: Value is not encrypted.");
        return encryptedText; // Return as-is if not encrypted
      }
      return encrypter.decrypt64(encryptedText, iv: iv);
    } catch (e) {
      print("❌ Decryption failed: $e");
      return encryptedText; // Return original text instead of crashing
    }
  }


}
