import 'package:excelapp/Services/Database/hive_operations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// used to pass messages from event handler to the UI
// final _messageStreamController = BehaviorSubject<RemoteMessage>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
  List notifications =
      await HiveDB.retrieveData(valueName: 'notifications') ?? [];
  final newNotification = {
    'data': message.data ?? {},
    'title': '${message.notification?.title}',
    'body': '${message.notification?.body}',
    'time': DateTime.now().toString()
  };
  notifications.add(newNotification);
  await HiveDB.storeData(valueName: 'notifications', value: notifications);
  int count = await HiveDB.retrieveData(valueName: 'unread_notifications');
  count = count ?? 0;
  await HiveDB.storeData(valueName: 'unread_notifications', value: count + 1);
}

void initiliaseNotificationServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final messaging = FirebaseMessaging.instance;

  // final settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

//   if (kDebugMode) {
//     print('Permission granted: ${settings.authorizationStatus}');
//   }
  String token = await messaging.getToken();

  if (kDebugMode) {
    print('Registration Token=$token');
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    if (kDebugMode) {
      print("Handling a background message: ${message.messageId}");
      print('Message data: ${message.data}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }
    if (message.notification != null) {
      print(
          'Message also contained a notification: ${message.notification.title}');

      List notifications =
          await HiveDB.retrieveData(valueName: 'notifications') ?? [];
      final newNotification = {
        'data': message.data ?? {},
        'title': '${message.notification?.title}',
        'body': '${message.notification?.body}',
        'time': DateTime.now().toString()
      };
      notifications.add(newNotification);
      await HiveDB.storeData(valueName: 'notifications', value: notifications);
      int count = await HiveDB.retrieveData(valueName: 'unread_notifications');
      count = count ?? 0;
      await HiveDB.storeData(
          valueName: 'unread_notifications', value: count + 1);
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}
