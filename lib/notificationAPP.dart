import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:new_notification/noti.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Noti.initialize(flutterLocalNotificationsPlugin);
  }

  void _simpleNotification() {
    Noti.showBigTextNotification(
        title: 'Hurray!!',
        body: 'This is your first notification',
        fln: flutterLocalNotificationsPlugin);
  }

  void _periodicNotification() {
    Noti.showPerodicNotification(
        title: 'Hurray!!',
        body: 'This will appear again in 1 min',
        fln: flutterLocalNotificationsPlugin);
  }

  void _cancelPerodicNotification() {
    Noti.cancelPerodicNotification(id: 1, fln: flutterLocalNotificationsPlugin);
  }

  void _scheduledNotification() {
    Noti.showScheduledNotification(
        title: 'Scheduled Notification',
        body: 'This is a scheduled notification.',
        fln: flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff1f005c),
          Color(0xff5b0060),
          Color(0xff870160),
          Color(0xffac255e),
          Color(0xffca485c),
          Color(0xffe16b5c),
          Color(0xfff39060),
          Color(0xffffb56b),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                title: 'Simple Notification',
                onPressed: _simpleNotification,
                icon: Icons.notifications,
                // type: Noti.showBigTextNotification(
                //     title: 'Hurray!!',
                //     body: 'This is your first notification',
                //     fln: flutterLocalNotificationsPlugin),
              ),
              CustomButton(
                title: 'Periodic Notification',
                onPressed: _periodicNotification,
                icon: Icons.av_timer,
                // type: Noti.showBigTextNotification(
                //     title: 'Hurray!!',
                //     body: 'This is your first notification',
                //     fln: flutterLocalNotificationsPlugin),
              ),
              CustomButton(
                title: 'Cancel Perodic Notification',
                onPressed: _cancelPerodicNotification,
                icon: Icons.timer_off_outlined,

                // type: Noti.showBigTextNotification(
                //     title: 'Hurray!!',
                //     body: 'This is your first notification',
                //     fln: flutterLocalNotificationsPlugin),
              ),
              CustomButton(
                  icon: Icons.access_time_rounded,
                  title: 'Schedule Notification',
                  onPressed: _scheduledNotification)
            ]),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  // Future<dynamic> type;
  VoidCallback onPressed;
  IconData icon;
  String title;
  CustomButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    // required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 12,
              offset: Offset(5, 1),
            )
          ]),
          height: 40,
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  elevation: 9,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepOrange),
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(title)),
        ),
      ),
    );
  }
}
