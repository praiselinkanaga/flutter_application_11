import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StockAvailable extends StatelessWidget {
  const StockAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: const Color(0xff3157F6),
            title: const Text(
              "Stocks Available",
              style: kBodyText1,
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        "assets/images/search-black.svg",
                        color: Colors.grey.shade400,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    suffixIcon: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SvgPicture.asset(
                          "assets/images/black-arrow-back.svg",
                          width: 18,
                          height: 18,
                        )),
                    hintText: "search",
                    hintStyle: gBodyText1,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                    //color: Colors.blue,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage("assets/images/speaker.jpg"))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "Alexa Bluetooth speaker",
                        style: bHeading4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 130),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/images/coin-stack-blue.svg"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "275 Nos.",
                            style: bBodyText2,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 130),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/images/rupee-blue.svg"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "3,684.00",
                            style: bBodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
