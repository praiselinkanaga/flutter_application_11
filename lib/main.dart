import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/providers/tickets_provider.dart';
import 'package:flutter_application_11/splash_screen.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/views/admin/admin_login.dart';
import 'package:flutter_application_11/views/login/login.dart';
import 'package:flutter_application_11/widgets/background_image.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
late FirebaseMessaging messaging;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  messaging = FirebaseMessaging.instance;
  messaging.subscribeToTopic("flutter-notification");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
        'flutter_notification', // id
        'flutter_notification_title', // title
        description: 'flutter_notification_description', // description
        importance: Importance.high,
        enableLights: true,
        enableVibration: true,
        showBadge: true,
        playSound: true);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: ((context) => TicketProvider()),
        child: MaterialApp(
          title: 'Demo App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.openSansTextTheme(),
          ),
          home: const SplashScreen(),
        ));
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.linearToEaseOut);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundImage(),
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          body: SizeTransition(
            sizeFactor: _animation,
            axis: Axis.vertical,
            axisAlignment: -1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/Icon.svg"),
                  const SizedBox(
                    height: 80,
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const AdminLoginPage())));
                    }),
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: const BoxDecoration(color: Color(0xff8D29FF)),
                      child: ListTile(
                        leading: const Icon(
                          Icons.shield,
                          color: Colors.white,
                        ),
                        title: const Text(
                          "ADMIN",
                          style: kBodyText2,
                        ),
                        trailing: SvgPicture.asset(
                            "assets/images/white-arrow-back.svg"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LoginPage())));
                    }),
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: const BoxDecoration(color: Color(0xff3157F6)),
                      child: ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        title: const Text(
                          "SERVICE EMPLOYEE",
                          style: kBodyText2,
                        ),
                        trailing: SvgPicture.asset(
                            "assets/images/white-arrow-back.svg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
