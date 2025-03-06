import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ExpenseTrek/app/services/secure_storage_service.dart';
import 'secure_storage_service_test.mocks.dart'; // Import generated mock

@GenerateMocks([FlutterSecureStorage])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // ✅ Prevents MissingPluginException

  late SecureStorageServicepin storageService;
  late MockFlutterSecureStorage mockSecureStorage;

  setUp(() {
    mockSecureStorage = MockFlutterSecureStorage();
    storageService = SecureStorageServicepin(storage: mockSecureStorage); // ✅ Inject Mock
  });

  test('should store PIN correctly', () async {
    when(mockSecureStorage.write(key: anyNamed('key'), value: anyNamed('value')))
        .thenAnswer((_) async {});

    await storageService.storePin('1234');

    verify(mockSecureStorage.write(key: 'user_pin', value: '1234')).called(1);
  });

  test('should retrieve stored PIN', () async {
    when(mockSecureStorage.read(key: anyNamed('key')))
        .thenAnswer((_) async => '1234');

    final pin = await storageService.getPin();

    expect(pin, '1234');
    verify(mockSecureStorage.read(key: 'user_pin')).called(1);
  });

  test('should delete stored PIN', () async {
    when(mockSecureStorage.delete(key: anyNamed('key')))
        .thenAnswer((_) async {});

    await storageService.deletePin();

    verify(mockSecureStorage.delete(key: 'user_pin')).called(1);
  });
}
