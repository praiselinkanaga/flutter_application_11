import 'package:flutter/material.dart';
import 'package:flutter_application_11/views/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../style.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({super.key});

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  bool isEnable = false;
  bool _secureText = true;
  bool _secureText1 = true;
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // void validateButton() {
  //   bool isValid = true;
  //   isValid = formKey.currentState!.validate();

  //   setState(() {
  //     isEnable = isValid;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Container(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/images/close.svg")),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Set Password",
                  style: bHeading1,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Form(
                    key: formKey,
                    onChanged: () {
                      setState(() {
                        isEnable = formKey.currentState!.validate();
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "NEW PASSWORD",
                          style: bBodyText1,
                        ),
                        TextFormField(
                          style: bBodyText2,
                          keyboardType: TextInputType.text,
                          obscureText: _secureText,
                          controller: newPasswordController,
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
                          // onSaved: (newValue) {
                          //   setState(() {
                          //     newPasswordController.text = newValue!;
                          //   });
                          // },
                          decoration: InputDecoration(
                            helperText: "",
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffAAAAAA))),
                            suffixIcon: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                },
                                child: SvgPicture.asset(
                                  _secureText
                                      ? "assets/images/hide-grey.svg"
                                      : "assets/images/unhide-grey.svg",
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "CONFIRM PASSWORD",
                          style: bBodyText1,
                        ),
                        TextFormField(
                          controller: confirmPasswordController,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'Field is required.';
                            }
                            if (newPasswordController.text !=
                                confirmPasswordController.text) {
                              return "Password does not match";
                            }
                            return null;
                          }),
                          // onSaved: (newValue) {
                          //   setState(() {
                          //     confirmPasswordController.text = newValue!;
                          //   });
                          // },
                          decoration: InputDecoration(
                            helperText: "",
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffAAAAAA))),
                            suffixIcon: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: InkWell(
                                onTap: () {
                                  _secureText1 = !_secureText1;
                                },
                                child: SvgPicture.asset(
                                  _secureText1
                                      ? "assets/images/hide-grey.svg"
                                      : "assets/images/unhide-grey.svg",
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                          style: bBodyText2,
                          keyboardType: TextInputType.text,
                          obscureText: _secureText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: //isEnable
                          const Color(0xff3157F6),
                      // : const Color(0xffE4E4E4),
                      minimumSize: const Size(370, 60),
                      textStyle: kBodyText,
                    ),
                    onPressed: (() {
                      // isEnable
                      //     ? () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const HomePage())));

                        print("Password Setted Successfully");
                      }
                    }
                        // : null;
                        // }
                        ),
                    child: const Text("SET PASSWORD"),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
