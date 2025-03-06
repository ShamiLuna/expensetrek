import 'package:flutter_test/flutter_test.dart';
import 'package:ExpenseTrek/app/services/encryption_service.dart';

void main() {
  late EncryptionService encryptionService;

  setUp(() {
    encryptionService = EncryptionService();
  });

  group('EncryptionService', () {
    test('should encrypt and then successfully decrypt the data', () {
      const originalText = 'HelloWorld123!';

      final encryptedText = encryptionService.encryptData(originalText);
      expect(encryptedText, isNot(originalText)); // Ensure it's actually encrypted

      final decryptedText = encryptionService.decryptData(encryptedText);
      expect(decryptedText, originalText); // It should match original text
    });

    test('should return plain text if input is not encrypted', () {
      const nonEncryptedText = 'PlainText';

      final result = encryptionService.decryptData(nonEncryptedText);
      expect(result, nonEncryptedText);
    });

    test('should handle invalid Base64 without crashing', () {
      const invalidBase64 = 'invalid@@text!!';

      final result = encryptionService.decryptData(invalidBase64);
      expect(result, invalidBase64); // It should return the original text safely
    });
  });
}
