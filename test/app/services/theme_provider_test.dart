import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ExpenseTrek/app/services/theme_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // ✅ Initialize Flutter binding

  late ThemeProvider themeProvider;

  setUp(() async {
    SharedPreferences.setMockInitialValues({}); // ✅ Mock SharedPreferences
    themeProvider = ThemeProvider();
    await Future.delayed(Duration(milliseconds: 500)); // ✅ Ensure state updates
  });

  test('ThemeProvider should save and load theme correctly', () async {
    themeProvider.setTheme(MyThemes.greenTheme);
    await Future.delayed(Duration(milliseconds: 500)); // ✅ Wait for save

    final newThemeProvider = ThemeProvider();
    await Future.delayed(Duration(milliseconds: 500)); // ✅ Wait for load

    expect(newThemeProvider.currentTheme, MyThemes.greenTheme);
  });
}
