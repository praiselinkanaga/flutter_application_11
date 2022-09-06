import 'package:flutter/material.dart';
import 'package:flutter_application_11/screens.dart/Reschedule.dart';
import 'package:flutter_application_11/screens.dart/add_product.dart';
import 'package:flutter_application_11/screens.dart/other.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EndTask extends StatelessWidget {
  const EndTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            width: 450,
            height: 200,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "End Task",
                            style: bHeading3,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:
                                  SvgPicture.asset("assets/images/close.svg")),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const AddProduct())));
                        },
                        child: const Text(
                          "Add Product",
                          style: bBodyText1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const Reschedule())));
                              },
                              child: const Text("Reschedule")),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const Reschedule())));
                              },
                              child: SvgPicture.asset(
                                  "assets/images/calendar-blue.svg"))
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const OtherPage())));
                        },
                        child: const Text(
                          "Other",
                          style: bBodyText1,
                        ),
                      ),
                    ]))));
  }
}
