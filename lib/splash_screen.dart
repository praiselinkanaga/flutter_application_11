import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.blue
            // image: DecorationImage(
            //     image: AssetImage("assets/images/background.png"),
            //     fit: BoxFit.cover)
            ),
        child: AnimatedSplashScreen(
          splash: SvgPicture.asset("assets/images/Icon.svg"),
          nextScreen: const MainPage(),
          animationDuration: const Duration(seconds: 2),
          splashTransition: SplashTransition.scaleTransition,
          duration: 3000,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
