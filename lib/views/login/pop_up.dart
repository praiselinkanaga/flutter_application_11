import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../style.dart';

class OtpBottomSheet extends StatelessWidget {
  const OtpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: 450,
          height: 350,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                    "Enter OTP",
                    style: bBodyText1,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, top: 30),
                      child: SvgPicture.asset("assets/images/close.svg"),
                    )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("ENTER 6-DIGIT OTP"),
                ),
                const SizedBox(
                  height: 35,
                ),
                Form(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          //controller: codeController,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          style: bBodyText2,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          //controller: codeController,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          style: kBodyText,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          //controller: codeController,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          style: kBodyText,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          //controller: codeController,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          style: kBodyText,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          //controller: codeController,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          style: kBodyText,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    onSurface: const Color(0xff3157F6),
                    minimumSize: const Size(350, 60),
                    textStyle: kBodyText,
                  ),
                  onPressed: (() {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: ((context) =>
                    //             const RegisterDetailsPage())));
                  }),
                  child: const Text("VERIFY"),
                ),
              )
            ])
          ])),
    );
  }
}
