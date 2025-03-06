import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin;

  // ✅ Constructor: Accepts a FlutterLocalNotificationsPlugin instance (Dependency Injection)
  LocalNotificationService(this.notificationsPlugin);

  /// 🔹 Initialize Notifications
  Future<void> initialize() async {
    tz.initializeTimeZones();
    String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));

    const AndroidInitializationSettings androidInitSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initSettings =
    InitializationSettings(android: androidInitSettings);

    await notificationsPlugin.initialize(initSettings);
  }

  /// 🔹 Schedule a notification 10 minutes after install
  Future<void> scheduleNotificationAfterInstall() async {
    await notificationsPlugin.zonedSchedule(
      0,
      'Reminder!',
      'Check your transactions now!',
      tz.TZDateTime.now(tz.local).add(const Duration(minutes: 10)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'install_channel',
          'Install Reminder',
          channelDescription:
          'You will get daily and weekly notifications as reminders',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  /// 🔹 Schedule a daily expense reminder (Every day at 8 PM)
  Future<void> scheduleDailyExpenseReminder() async {
    await notificationsPlugin.zonedSchedule(
      1,
      'Expense Check',
      'Have you reviewed your expenses today?',
      _nextInstanceOfTime(20, 0),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder_channel',
          'Daily Expense Reminder',
          channelDescription: 'Reminds users to check their expenses at 8 PM',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  /// 🔹 Schedule a weekly budget check (Every Sunday at 10 AM)
  Future<void> scheduleWeeklyBudgetCheck() async {
    await notificationsPlugin.zonedSchedule(
      2,
      'Weekly Budget Check',
      'Review your budget for the upcoming week!',
      _nextInstanceOfDay(7, 10, 0),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'weekly_budget_channel',
          'Weekly Budget Reminder',
          channelDescription: 'Encourages users to review their budget weekly',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  /// 🔹 Helper function to get next instance of time (e.g., 8:00 PM)
  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  /// 🔹 Helper function to get next Sunday at 10 AM
  tz.TZDateTime _nextInstanceOfDay(int weekday, int hour, int minute) {
    tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
        now.day, hour, minute);
    while (scheduledDate.weekday != weekday) {
      scheduledDate = scheduledDate.add(Duration(days: 1));
    }
    return scheduledDate;
  }
}
