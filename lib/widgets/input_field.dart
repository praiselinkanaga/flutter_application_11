import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/views/admin/set_password.dart';
import 'package:flutter_application_11/views/login/forget_password.dart';
import 'package:flutter_application_11/style.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final countryPicker = const FlCountryCodePicker();
  bool _secureText = true;
  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final codeController = TextEditingController();
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
                "CONTACT NUMBER",
                style: kBodyText1,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            borderSide: BorderSide(color: Colors.white)),
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            final code = await countryPicker.showPicker(
                                context: context, isFullScreen: true);

                            if (code != null) print(code.dialCode);
                            setState(() {
                              codeController.text = code!.dialCode;
                            });
                          },
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: SvgPicture.asset(
                              "assets/images/down-white.svg",
                              width: 15,
                              height: 15,
                            ),
                          ),
                        ),
                      ),
                      style: kBodyText1,
                      keyboardType: TextInputType.none,
                      showCursor: false,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    flex: 3,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: contactNumberController,
                      validator: (value) {
                        if (Validator.phone(value)) {
                          return 'Please input a valid phone number.';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        helperText: "",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        suffix: Icon(
                          Icons.done,
                          color: Color(0xff2AC120),
                          size: 18,
                        ),
                      ),
                      style: kBodyText1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
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
                              ? "assets/images/hide-white.svg"
                              : "assets/images/unhide-white.svg",
                          width: 15,
                          height: 15,
                        ),
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
                  primary: const Color(0xff3157F6),
                  minimumSize: const Size(double.infinity, 60),
                  textStyle: kBodyText,
                ),
                onPressed: (() {
                  if (formKey.currentState!.validate()) {
                    //formKey.currentState!.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SetPasswordPage())));
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
  // onEditingComplete: () async {
  //   String springFieldUSASimpleNoRegion = '9042119352';
  //   RegionInfo region =
  //       RegionInfo(name: "India", code: "IN", prefix: 91);
  //   PhoneNumber phoneNumber = await PhoneNumberUtil().parse(
  //       springFieldUSASimpleNoRegion,
  //       regionCode: region.code);
  //   PhoneNumberUtil plugin = PhoneNumberUtil();

  //   bool isvalid =
  //       await plugin.validate('9042119352', region.code);
  //   print(phoneNumber);
  //   print(isvalid);
  // },

  // void setCountryData(CountryCode country, context) {
  //   setState(() {
  //     name = country.name;
  //     codeController.text = country.dialCode;
  //   });
  //   Navigator.pop(context);
  // }

  // void validate() {
  //   if (formKey.currentState!.validate()) {
  //     debugPrint("Success");
  //   } else {
  //     debugPrint("Error");
  //   }
  // }

  // String? validatepassword(value) {
  //   if (value.isEmpty) {
  //     return "Password Required";
  //   } else if (value.length < 8) {
  //     return "Should be atleast 8 character";
  //   } else if (value.length > 15) {
  //     return "Should be between 8 to 15 character";
  //   } else {
  //     return null;
  //   }
  // }

//   String? validatecontact(value) {
//     if (value.isEmpty) {
//       return "Required";
//     } else if (value.length < 7) {
//       return "Should be atleast 7 character";
//     } else if (value.length > 15) {
//       return "Should be between 10 to 15 character";
//     } else {
//       return null;
//     }
//   }

  // validator: (value) {
  //   if (value == null || value.isEmpty) {
  //     return "Field is Required";
  //   }
  //   return null;
  // },
  // onSaved: (value) {
  //   setState(() {
  //     contactNumberController.text = value!;
  //   });
  // },
}
