import 'package:flutter/material.dart';
import 'package:flutter_application_11/views/admin/admin_home.dart';
import 'package:flutter_application_11/views/login/forget_password.dart';
import 'package:flutter_application_11/style.dart';

import 'package:flutter_svg/flutter_svg.dart';

class AdminInputField extends StatefulWidget {
  const AdminInputField({super.key});

  @override
  State<AdminInputField> createState() => _AdminInputFieldState();
}

class _AdminInputFieldState extends State<AdminInputField> {
  bool _secureText = true;
  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "EMAIL / PHONE NUMBER",
                style: kBodyText1,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: contactNumberController,
                decoration: const InputDecoration(
                  helperText: "",
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
                style: kBodyText,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "PASSWORD",
                style: kBodyText1,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field is required.';
                  }
                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  if (!RegExp(pattern).hasMatch(value)) {
                    return '''Password must be at least 8 characters,
                            include an uppercase letter, number and symbol.''';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  helperText: "",
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _secureText = !_secureText;
                      });
                    },
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        _secureText
                            ? "assets/images/hide-white.svg"
                            : "assets/images/unhide-white.svg",
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ),
                ),
                style: kBodyText,
                keyboardType: TextInputType.text,
                obscureText: _secureText,
              ),
            ]),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ForgetPasswordPage()))),
                  child: const Text(
                    "FORGET PASSWORD?",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: const Color(0xff8D29FF),
                  minimumSize: const Size(double.infinity, 60),
                  textStyle: kBodyText,
                ),
                onPressed: (() {
                  if (formKey.currentState!.validate()) {
                    //formKey.currentState!.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const AdminHomePage())));
                    print("Login Successfully");
                  }
                }),
                child: const Text("LOGIN"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
