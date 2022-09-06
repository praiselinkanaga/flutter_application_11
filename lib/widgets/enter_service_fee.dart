import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/views/home/home.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ServiceFee extends StatelessWidget {
  const ServiceFee({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: 450,
          height: 300,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Enter Service Fee",
                          style: bHeading3,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset("assets/images/close.svg")),
                      ],
                    ),
                    const Text(
                      "AMOUNT",
                      style: bBodyText1,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffAAAAAA))),
                          suffixIcon: Icon(Icons.currency_rupee)),
                      style: bBodyText2,
                      keyboardType: TextInputType.text,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: const Color(0xffFFFFFF),
                        onSurface: const Color(0xff3157F6),
                        minimumSize: const Size(370, 60),
                        textStyle: kBodyText,
                      ),
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const HomePage(
                                      page: 1,
                                    ))));
                      }),
                      child: const Text("SUBMIT"),
                    ),
                  ]))),
    );
  }
}
