import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//user data
class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // ✅ Store Data
  Future<void> storeData(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  // ✅ Retrieve Data
  Future<String?> getData(String key) async {
    return await _secureStorage.read(key: key);
  }

  // ✅ Delete All Data (for logout)
  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
