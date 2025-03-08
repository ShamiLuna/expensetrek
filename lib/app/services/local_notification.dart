import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  static const MethodChannel _channel = MethodChannel('local_notifications');

  // ✅ Schedule Local Notification using Native Code (only for Android/iOS)
  Future<void> scheduleNotification() async {
    if (kIsWeb) {
      print("⚠️ Local notifications not supported on Web.");
      return;
    }

    try {
      final String result = await _channel.invokeMethod('scheduleNotification');
      print("✅ $result");
    } catch (e) {
      print("❌ Error scheduling local notification: $e");
    }
  }

  // ✅ Initialize Firebase Messaging (FCM)
  Future<void> initializeFCM() async {
    final FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();

    // ✅ Get FCM Token & Send to Backend
    String? token = await messaging.getToken();
    if (token != null) {
      print("🔹 FCM Token: $token");
      await sendTokenToServer(token);
    }

    // ✅ Listen for Foreground Firebase Notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("🔔 Foreground FCM Notification: ${message.notification?.title}");
    });

    // ✅ Handle Background Notifications
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // ✅ Send token to backend for topic subscription
  Future<void> sendTokenToServer(String token) async {
    try {
      final response = await http.post(
        Uri.parse('https://your-backend.com/api/subscribe'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': token, 'topic': 'news'}),
      );

      if (response.statusCode == 200) {
        print("✅ Successfully subscribed to topic via backend");
      } else {
        print("❌ Error subscribing: ${response.body}");
      }
    } catch (e) {
      print("❌ Exception: $e");
    }
  }
}

// ✅ Background FCM Handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("🔔 Background Firebase Notification: ${message.notification?.title}");
}
