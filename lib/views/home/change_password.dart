import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/views/home/profile.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _secureText = true;
  bool _secureText1 = true;
  bool _secureText2 = true;
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          title: const Text(
            "Change Password",
            style: kBodyText,
          ),
          backgroundColor: const Color(0xff3157F6),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "CURRENT PASSWORD",
                            style: bBodyText1,
                          ),
                        ),
                        TextFormField(
                          controller: currentPasswordController,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffAAAAAA))),
                            suffixIcon: Container(
                              child: FittedBox(
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
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "NEW PASSWORD",
                            style: bBodyText1,
                          ),
                        ),
                        TextFormField(
                          controller: newPasswordController,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffAAAAAA))),
                            suffixIcon: Container(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _secureText1 = !_secureText1;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    _secureText1
                                        ? "assets/images/hide-grey.svg"
                                        : "assets/images/unhide-grey.svg",
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "CONFIRM PASSWORD",
                            style: bBodyText1,
                          ),
                        ),
                        TextFormField(
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffAAAAAA))),
                            suffixIcon: Container(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _secureText2 = !_secureText2;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    _secureText2
                                        ? "assets/images/hide-grey.svg"
                                        : "assets/images/unhide-grey.svg",
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 390,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: const Color(0xffFFFFFF),
                    primary: const Color(0xff3157F6),
                    minimumSize: const Size(370, 60),
                    textStyle: kBodyText,
                  ),
                  onPressed: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const ProfilePage())));
                  }),
                  child: const Text("SAVE"))
            ],
          ),
        ),
      ),
    );
  }
}
