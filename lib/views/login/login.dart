import 'package:flutter/material.dart';

import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/widgets/background_image.dart';
import 'package:flutter_application_11/widgets/input_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                            //padding: const EdgeInsets.only(left: 10.0),
                            child: const Text(
                              "Hello.",
                              style: kHeading,
                            ),
                          ),
                        ),
                        Container(
                          //padding: const EdgeInsets.only(left: 10.0),
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
                        InputField(),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 150,
                    // ),
                    // Column(
                    //   children: [
                    //     Container(
                    //       //padding: const EdgeInsets.only(right: 10),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           const Text(
                    //             "Don't have an account?",
                    //             style: kBodyText1,
                    //           ),
                    //           const SizedBox(
                    //             width: 10,
                    //           ),
                    //           InkWell(
                    //             onTap: () {
                    //               Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: ((context) =>
                    //                           const RegisterPage())));
                    //             },
                    //             child: const Text(
                    //               "REGISTER",
                    //               style: TextStyle(
                    //                 fontSize: 12,
                    //                 fontWeight: FontWeight.w400,
                    //                 color: Colors.white,
                    //                 decoration: TextDecoration.underline,
                    //                 decorationColor: Colors.white,
                    //                 decorationThickness: 3.0,
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // )
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
