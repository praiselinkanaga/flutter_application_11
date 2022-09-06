import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/database/admin_notification.dart';
import 'package:flutter_application_11/main.dart';
import 'package:flutter_application_11/views/admin/admin_dashboard.dart';
import 'package:flutter_application_11/views/admin/admin_notification.dart';
import 'package:flutter_application_11/views/admin/employee.dart';
import 'package:flutter_application_11/views/admin/tickets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminHomePage extends StatefulWidget {
  final page;
  const AdminHomePage({super.key, this.page});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int selected = 0;
  bool on = true;
  final screens = [
    const AdminDashboard(),
    const Employee(),
    const AdminTickets()
  ];
  final AdminNotificationDb _adminNotificationDb = AdminNotificationDb();
  late final PageController _pageController = PageController();
  void _handleMessage(Map<String, dynamic> data) {
    print("Onclick Data$data");
    // handle navigation here
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: ((context) => const AdminNotificationPage())));
  }

  Future<dynamic> onSelectNotification(payload) async {
    Map<String, dynamic> action = jsonDecode(payload);
    _handleMessage(action);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: ((context) => const AdminNotificationPage())));
  }

  Future<void> setupInteractedMessage() async {
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then((value) => _handleMessage(value != null ? value.data : {}));
  }

  @override
  void initState() {
    super.initState();
    _adminNotificationDb.database
        .then((value) => {print("database created.....")});

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = IOSInitializationSettings();
    const initSettings = InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: onSelectNotification);
    setupInteractedMessage();
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print("fcm token $token");
    });
    FirebaseMessaging.onMessage.listen((message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      print("Notification on message ==== ${message.notification!.title}");
      //print(message.notification!.title);

      if (notification != null && android != null && !kIsWeb) {
        String action = jsonEncode(message.data);
        _adminNotificationDb.database.then((value) {
          value.insert("adminnotification", {
            "name": message.notification!.title,
            "message": message.notification!.body
          });
          print(value);
        });

        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                tag: channel.description,
                priority: Priority.high,
                importance: Importance.max,
                setAsGroupSummary: true,
                styleInformation: const DefaultStyleInformation(true, true),
                largeIcon:
                    const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
                channelShowBadge: true,
                autoCancel: true,
                icon: '@mipmap/ic_launcher',
              ),
            ),
            payload: action);
      }
    });
    FirebaseMessaging.onMessageOpenedApp
        .listen((message) => _handleMessage(message.data));
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (widget.page != null) {
    //     setState(() {
    //       selected = widget.page;
    //       _pageController.jumpToPage(selected);
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffFFFFFF),
          appBar: AppBar(
            backgroundColor: const Color(0xffB226F6),
            leading: const Padding(
              padding: EdgeInsets.only(top: 5, left: 10, bottom: 5),
              child: InkWell(
                child: CircleAvatar(
                  radius: 5,
                  backgroundImage:
                      AssetImage("assets/images/admin-profile-page.jpg"),
                ),
              ),
            ),
            actions: [
              Container(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const AdminNotificationPage())));
                      },
                      child: SvgPicture.asset("assets/images/bell.svg"))),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8,
            currentIndex: selected,
            onTap: onClick,
            backgroundColor: const Color(0xffFFFFFF),
            selectedItemColor: const Color(0xffB226F6),
            unselectedItemColor: const Color(0xffAAAAAA),
            selectedLabelStyle: const TextStyle(
                //color: Color(0xff3157F6),
                fontWeight: FontWeight.w400,
                fontSize: 12),
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        (selected == 0)
                            ? "assets/images/violet-dashboard.svg"
                            : "assets/images/dashboard-grey.svg",
                        height: 15,
                        width: 15,
                      )),
                  label: "Dashboard"),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        (selected == 1)
                            ? "assets/images/violet-employee.svg"
                            : "assets/images/grey-employee.svg",
                        height: 15,
                        width: 15,
                      )),
                  label: "Employee"),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        (selected == 2)
                            ? "assets/images/violet-ticket.svg"
                            : "assets/images/grey-tickets.svg",
                        height: 15,
                        width: 15,
                      )),
                  label: "Tickets"),
            ],
          ),
          body: PageView(
            controller: _pageController,
            children: screens,
          )),
    );
  }

  void onClick(int index) {
    setState(() {
      selected = index;
      _pageController.jumpToPage(index);
    });
  }
}
