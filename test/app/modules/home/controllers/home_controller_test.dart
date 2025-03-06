import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ExpenseTrek/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

// ✅ Use @GenerateMocks to properly mock SecureStorage
@GenerateMocks([FlutterSecureStorage])
import 'home_controller_test.mocks.dart';

void main() {
  late HomeController homeController;
  late MockFlutterSecureStorage mockStorage; // ✅ Use generated mock

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    homeController = HomeController(secureStorage: mockStorage); // ✅ Inject mock
    Get.put(homeController);
  });

  test('should fetch stored expense transactions', () async {
    // ✅ Ensure mock always returns a Future<Map<String, String>>
    when(mockStorage.readAll()).thenAnswer((_) async => {
      "expense_123": "Food",
      "expense_123_amount": "150",
      "expense_123_time": "2024-03-07T10:00:00",
    });

    // ✅ Call method
    await homeController.fetchTitlesFromStorage();

    // ✅ Verify if data is retrieved correctly
    expect(homeController.items.length, 1);
    expect(homeController.items[0].title, "Food");
    expect(homeController.items[0].amount, "150");
  });
}
