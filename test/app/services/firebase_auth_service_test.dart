import 'package:ExpenseTrek/app/services/firebase_auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_service_test.mocks.dart';

@GenerateMocks([FirebaseAuth, UserCredential, User])
void main() {
  late AuthService authService;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();

    // ✅ Pass mock error handler
    authService = AuthService(
      firebaseAuth: mockFirebaseAuth,
      errorHandler: (title, message) {
        print("🔴 Error: $title - $message"); // ✅ Mock error handling
      },
    );
  });

  group('AuthService', () {
    test('should return user ID on successful signup', () async {
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn('123456');
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: 'test@example.com',
        password: 'password123',
      )).thenAnswer((_) async => mockUserCredential);

      final result =
      await authService.signUpUser('test@example.com', 'password123');

      expect(result, '123456');
    });

    test('should return null when signup fails', () async {
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: 'test@example.com',
        password: 'password123',
      )).thenThrow(FirebaseAuthException(code: 'email-already-in-use'));

      final result =
      await authService.signUpUser('test@example.com', 'password123');

      expect(result, null);
    });
  });
}
