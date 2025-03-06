import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:ExpenseTrek/app/services/local_notification.dart';

import 'local_notification_service_test.mocks.dart'; // ✅ Import the generated mock

@GenerateMocks([FlutterLocalNotificationsPlugin])
void main() {
  late MockFlutterLocalNotificationsPlugin mockNotificationsPlugin;
  late LocalNotificationService notificationService;

  setUp(() {
    tz.initializeTimeZones(); // ✅ Ensure time zones are initialized
    mockNotificationsPlugin = MockFlutterLocalNotificationsPlugin();
    notificationService = LocalNotificationService(mockNotificationsPlugin);
  });

  test('should schedule a notification after install', () async {
    // ✅ Stub the zonedSchedule method to return a Future<void>
    when(mockNotificationsPlugin.zonedSchedule(
      any,
      any,
      any,
      any,
      any,
      uiLocalNotificationDateInterpretation: anyNamed('uiLocalNotificationDateInterpretation'),
      matchDateTimeComponents: anyNamed('matchDateTimeComponents'),
      androidScheduleMode: anyNamed('androidScheduleMode'),
    )).thenAnswer((_) async {});

    await notificationService.scheduleNotificationAfterInstall();

    verify(mockNotificationsPlugin.zonedSchedule(
      any,
      'Reminder!',
      'Check your transactions now!',
      any,
      any,
      uiLocalNotificationDateInterpretation: anyNamed('uiLocalNotificationDateInterpretation'),
      matchDateTimeComponents: anyNamed('matchDateTimeComponents'),
      androidScheduleMode: anyNamed('androidScheduleMode'),
    )).called(1);
  });

  test('should schedule a daily expense reminder', () async {
    when(mockNotificationsPlugin.zonedSchedule(
      any,
      any,
      any,
      any,
      any,
      uiLocalNotificationDateInterpretation: anyNamed('uiLocalNotificationDateInterpretation'),
      matchDateTimeComponents: anyNamed('matchDateTimeComponents'),
      androidScheduleMode: anyNamed('androidScheduleMode'),
    )).thenAnswer((_) async {});

    await notificationService.scheduleDailyExpenseReminder();

    verify(mockNotificationsPlugin.zonedSchedule(
      any,
      'Expense Check',
      'Have you reviewed your expenses today?',
      any,
      any,
      uiLocalNotificationDateInterpretation: anyNamed('uiLocalNotificationDateInterpretation'),
      matchDateTimeComponents: anyNamed('matchDateTimeComponents'),
      androidScheduleMode: anyNamed('androidScheduleMode'),
    )).called(1);
  });

  test('should schedule a weekly budget check', () async {
    when(mockNotificationsPlugin.zonedSchedule(
      any,
      any,
      any,
      any,
      any,
      uiLocalNotificationDateInterpretation: anyNamed('uiLocalNotificationDateInterpretation'),
      matchDateTimeComponents: anyNamed('matchDateTimeComponents'),
      androidScheduleMode: anyNamed('androidScheduleMode'),
    )).thenAnswer((_) async {});

    await notificationService.scheduleWeeklyBudgetCheck();

    verify(mockNotificationsPlugin.zonedSchedule(
      any,
      'Weekly Budget Check',
      'Review your budget for the upcoming week!',
      any,
      any,
      uiLocalNotificationDateInterpretation: anyNamed('uiLocalNotificationDateInterpretation'),
      matchDateTimeComponents: anyNamed('matchDateTimeComponents'),
      androidScheduleMode: anyNamed('androidScheduleMode'),
    )).called(1);
  });
}
