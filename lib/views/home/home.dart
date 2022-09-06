import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/main.dart';
import 'package:flutter_application_11/screens.dart/notification_page.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/views/home/dashboard.dart';
import 'package:flutter_application_11/views/home/drawer.dart';
import 'package:flutter_application_11/views/home/profile.dart';
import 'package:flutter_application_11/views/home/tasks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  final page;
  const HomePage({super.key, this.page});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;
  bool on = true;
  final screens = [const Dashboard(), const Tasks(), const ProfilePage()];
  late final PageController _pageController = PageController();
  void _handleMessage(Map<String, dynamic> data) {
    print("Onclick Data$data");
    // handle navigation here
  }

  Future<dynamic> onSelectNotification(payload) async {
    Map<String, dynamic> action = jsonDecode(payload);
    _handleMessage(action);
  }

  Future<void> setupInteractedMessage() async {
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then((value) => _handleMessage(value != null ? value.data : {}));
  }

  @override
  void initState() {
    super.initState();
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

      if (notification != null && android != null && !kIsWeb) {
        String action = jsonEncode(message.data);

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.page != null) {
        setState(() {
          selected = widget.page;
          _pageController.jumpToPage(selected);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffFFFFFF),
          drawer: Drawer(
            backgroundColor: const Color(0xffFFFFFF),
            child: SingleChildScrollView(
                child: Container(
              child: Column(
                children: const [
                  HeaderDrawer(),
                  DrawerItems(),
                ],
              ),
            )),
          ),
          appBar: AppBar(
            backgroundColor: const Color(0xff3157F6),
            leading: Builder(builder: ((context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        "assets/images/menu.svg",
                        width: 18,
                        height: 18,
                      ),
                    )),
              );
            })),
            actions: [
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: (() {
                          setState(() {
                            on = !on;
                            // if (on == true) {
                            //   const Text("ON DUTY");
                            // } else {
                            //   const Text("OFF DUTY");
                            // }
                          });
                        }),
                        child: Text(
                          on == true ? "ON DUTY" : "OFF DUTY",
                          style: kBodyText2,
                        ),
                      ),
                      Switch.adaptive(
                        activeColor: const Color(0xff3157F6),
                        activeTrackColor: const Color(0xffFFFFFF),
                        value: on,
                        onChanged: (value) {
                          setState(() {
                            on = value;
                          });
                        },
                      ),
                    ],
                  )
                  // InkWell(
                  //     child: SvgPicture.asset("assets/images/search.svg"))
                  ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const NotificationPage())));
                      },
                      child: SvgPicture.asset("assets/images/bell.svg"))),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8,
            currentIndex: selected,
            onTap: onClick,
            backgroundColor: const Color(0xffFFFFFF),
            selectedItemColor: const Color(0xff3157F6),
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
                            ? "assets/images/dashboard-blue.svg"
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
                            ? "assets/images/task-blue.svg"
                            : "assets/images/task-grey.svg",
                        height: 15,
                        width: 15,
                      )),
                  label: "Tasks"),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        (selected == 2)
                            ? "assets/images/user-blue.svg"
                            : "assets/images/user-grey.svg",
                        height: 15,
                        width: 15,
                      )),
                  label: "Profile"),
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
