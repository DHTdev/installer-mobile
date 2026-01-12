import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/nav/nav.dart';

import 'firebase_options.dart';
import 'notifications/notifications_widget.dart';

class NotificationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// Handle background message (log, analytics, local DB, etc.)
    debugPrint('BG message: \\${message.messageId} data=\\${message.data}');

    await _initializeLocalNotification();
    await _showFlutterNotification(message);

  }

  static Future<void> _showFlutterNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    Map<String, dynamic>? data = message.data;

    final title = message.notification?.title ?? "N/A";
    final body = message.notification?.body ?? "N/A";

    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'mobile_installer_notifications_default',
      'Notifications importantes',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      playSound: true,
      enableVibration: true,
      visibility: NotificationVisibility.public,
    );

    DarwinNotificationDetails iOSDetails=const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iOSDetails
    );

    await flutterLocalNotificationsPlugin.show(
        DateTime.now().millisecondsSinceEpoch ~/ 1000,
        title,
        body,
        notificationDetails,
        payload: 'open_notifications',
    );
  }

  static Future<void> _initializeLocalNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings();

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload == 'open_notifications') {
          _goToNotifications();
        }
      },
    );
  }

  static Future<void> initializeNotification() async {
    final _firebaseMessaging = FirebaseMessaging.instance;
    final fcmToken = await _firebaseMessaging.getToken();
    print('FCM Token: ${fcmToken}');

    await _firebaseMessaging.requestPermission();


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showFlutterNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('app open from background notification: ${message.notification?.title}');
      _goToNotifications();
    });

    await _getFcmToken();
    await _initializeLocalNotification();
    await _getInitialNotification();

  }

  static Future<void> _getFcmToken() async {
    final fcmToken = await _firebaseMessaging.getToken();
    print('FCM Token: ${fcmToken}');
  }

  static Future<void> _getInitialNotification() async {
    RemoteMessage ? message = await FirebaseMessaging.instance.getInitialMessage();
      
    if(message!=null){
      print('App launched from terminated');

    }
  }

  static void _goToNotifications() {
    final context = appNavigatorKey.currentContext;
    if (context != null) {
      GoRouter.of(context).pushNamed(
        NotificationsWidget.routeName,
      );
    }
  }

}