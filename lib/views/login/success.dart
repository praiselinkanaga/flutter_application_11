import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/passwordlock.svg"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Password Set Successfully!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationSuccess extends StatefulWidget {
  const RegistrationSuccess({super.key});

  @override
  State<RegistrationSuccess> createState() => _RegistrationSuccessState();
}

class _RegistrationSuccessState extends State<RegistrationSuccess> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), (() {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/check.svg"),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  "Registration Successful! Navigating to Login Page.",
                  style: kHeading1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordUpdate extends StatefulWidget {
  const PasswordUpdate({super.key});

  @override
  State<PasswordUpdate> createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/passwordlock.svg"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Password Updated Successfully!",
                style: kHeading1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
