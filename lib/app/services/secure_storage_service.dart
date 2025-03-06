import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//again pin enter pin not password
class SecureStorageServicepin {
  final FlutterSecureStorage _storage;

  SecureStorageServicepin({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage(); // ✅ Allows Mock Injection

  Future<void> storePin(String pin) async {
    await _storage.write(key: 'user_pin', value: pin);
  }

  Future<String?> getPin() async {
    return await _storage.read(key: 'user_pin');
  }

  Future<void> deletePin() async {
    await _storage.delete(key: 'user_pin');
  }
}
