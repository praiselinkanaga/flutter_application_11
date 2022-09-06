import 'package:flutter/material.dart';

import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/widgets/admin_input_field.dart';
import 'package:flutter_application_11/widgets/background_image.dart';

import 'package:flutter_svg/flutter_svg.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset(
                  'assets/images/leading-icon.svg',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 150),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: const Text(
                              "Hello.",
                              style: kHeading,
                            ),
                          ),
                        ),
                        Container(
                          child: const Text(
                            "Welcome Back",
                            style: kHeading,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: const [
                        AdminInputField(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
