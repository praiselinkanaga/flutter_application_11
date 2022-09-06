import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/views/login/reset_password.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final countryPicker = const FlCountryCodePicker();
  bool isValid = false;
  final codeController = TextEditingController();
  final contactNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Text(
                      "Forgot Password?",
                      style: bHeading1,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Form(
                      key: formKey,
                      onChanged: () {
                        setState(() {
                          isValid = formKey.currentState!.validate();
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "CONTACT NUMBER",
                            style: bBodyText1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: codeController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field is Required";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      codeController.text = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    helperText: "",
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffAAAAAA))),
                                    suffixIcon: GestureDetector(
                                      onTap: () async {
                                        final code =
                                            await countryPicker.showPicker(
                                                context: context,
                                                isFullScreen: true);

                                        if (code != null) print(code.dialCode);
                                        setState(() {
                                          codeController.text = code!.dialCode;
                                        });
                                      },
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: SvgPicture.asset(
                                          "assets/images/down-black.svg",
                                          width: 15,
                                          height: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  style: bBodyText2,
                                  keyboardType: TextInputType.none,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                flex: 3,
                                child: TextFormField(
                                  controller: contactNumberController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field is Required";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      contactNumberController.text = value!;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    helperText: "",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffAAAAAA))),
                                    suffix: Icon(
                                      Icons.done,
                                      color: Color(0xff2AC120),
                                      size: 18,
                                    ),
                                  ),
                                  style: bBodyText2,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    const snackBar = const SnackBar(
                                      content: Text(
                                        "OTP sent to the registered mobile number",
                                        style: kBodyText2,
                                        textAlign: TextAlign.center,
                                      ),
                                      duration: Duration(
                                          seconds: 2, milliseconds: 500),
                                      backgroundColor: Color(0xffF91C1C),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  child: const Text(
                                    "SEND OTP",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff3157F6),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xff3157F6),
                                      decorationThickness: 3.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "ENTER 6-DIGIT OTP",
                                style: bBodyText1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 60,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      //controller: codeController,
                                      decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                      style: kBodyText,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      //controller: codeController,
                                      decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                      style: kBodyText,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      //controller: codeController,
                                      decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                      style: kBodyText,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      //controller: codeController,
                                      decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                      style: kBodyText,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      //controller: codeController,
                                      decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                      style: kBodyText,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 350,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: isValid
                          ? const Color(0xff3157F6)
                          : const Color(0xffE4E4E4),
                      minimumSize: const Size(double.infinity, 60),
                      textStyle: kBodyText,
                    ),
                    onPressed: (() {
                      isValid
                          ? () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const ResetPasswordPage())));
                                print("verified");
                              }
                            }
                          : null;
                    }),
                    child: const Text(
                      "VERIFY",
                    ),
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
