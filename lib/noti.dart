import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    tz.initializeTimeZones();

    // void onDidReceiveLocalNotification(
    //     int id, String title, String body, String? payload) async {
    //   // display a dialog with the notification details, tap ok to go to another page
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) => CupertinoAlertDialog(
    //       title: Text(title),
    //       content: Text(body),
    //       actions: [
    //         CupertinoDialogAction(
    //           isDefaultAction: true,
    //           child: Text('Ok'),
    //           onPressed: () async {
    //             Navigator.of(context, rootNavigator: true).pop();
    //             await Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => MyApp(),
    //               ),
    //             );
    //           },
    //         )
    //       ],
    //     ),
    //   );
    // }

    // const AndroidInitializationSettings initializationSettingsAndroid =
    //     AndroidInitializationSettings('mipmap/ic_launcher');
    // const DarwinInitializationSettings initializationSettingsDarwin =
    //     DarwinInitializationSettings(onDidReceiveLocalNotification: null);
    // const LinuxInitializationSettings initializationSettingsLinux =
    //     LinuxInitializationSettings(defaultActionName: 'Open notification');
    // const InitializationSettings initializationSettings =
    //     InitializationSettings(
    //         android: initializationSettingsAndroid,
    //         iOS: initializationSettingsDarwin,
    //         linux: initializationSettingsLinux);
    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onDidReceiveNotificationResponse: null);

    var androidInit = const AndroidInitializationSettings('mipmap/ic_launcher');
    var iOSInit = const DarwinInitializationSettings();
    var initSettings =
        InitializationSettings(android: androidInit, iOS: iOSInit);
    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'this_is_my_notification_details',
      'my_channel',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    var not = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: const DarwinNotificationDetails());
    await fln.show(0, title, body, not);
  }

  static Future showPerodicNotification(
      {required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'channel_2',
      'my_channel2',
      channelDescription: 'channel Des',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    var not = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: const DarwinNotificationDetails());
    await fln.show(1, 'Perodic notification active',
        'Notification will repeat at 1 min interval', not);
    await fln.periodicallyShow(1, title, body, RepeatInterval.everyMinute, not,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

  static Future showScheduledNotification(
      {required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    await fln.zonedSchedule(
        2,
        'scheduled title',
        'scheduled body',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description'),
            iOS: DarwinNotificationDetails()),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static Future cancelPerodicNotification(
      {required int id, required FlutterLocalNotificationsPlugin fln}) async {
    fln.cancel(id);
  }
}
