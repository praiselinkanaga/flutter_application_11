import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceReportDetails extends StatefulWidget {
  const ServiceReportDetails({Key? key}) : super(key: key);

  @override
  State<ServiceReportDetails> createState() => _ServiceReportDetailsState();
}

class _ServiceReportDetailsState extends State<ServiceReportDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xff3157F6),
          title: const Text(
            "Service Report Details",
            style: kBodyText1,
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: const Color(0xffFAFAFA),
              child: ListTile(
                  leading: const Text(
                    "Corpfield",
                    style: bHeading4,
                  ),
                  trailing: Wrap(
                    spacing: 12,
                    children: [
                      SvgPicture.asset("assets/images/calendar-blue.svg"),
                      const Text(
                        "01-07-2022",
                        style: bBodyText2,
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ticket ID",
                    style: bLBodyText1,
                  ),
                  const Text("21549531"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Task Name",
                    style: bLBodyText1,
                  ),
                  const Text(
                    "Laptop Repair",
                    style: bBodyText1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Service Employee",
                    style: bLBodyText1,
                  ),
                  const Text("Rudransh Hamchinamani", style: bBodyText1),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Customer Name",
                    style: bLBodyText1,
                  ),
                  const Text("Ednit Chaudry", style: bBodyText1),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Contact Number",
                    style: bLBodyText1,
                  ),
                  const Text("+91-6705329273", style: bBodyText1),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Service Fee",
                    style: bLBodyText1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Remark",
                    style: bLBodyText1,
                  ),
                  const Text(
                    "Customer purchased a portable laptop, model number LAPTOP XXX123. The hard disk keeps crashing repeatedly and the screen goes blank. Customer needs to get this solved as soon as possible.",
                    maxLines: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Product Details",
                    style: bHeading4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage("assets/images/speaker.jpg"))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            "Alexa Bluetooth speaker",
                            style: bHeading4,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Product ID: 1485351",
                              style: gBodyText2,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Wrap(
                              spacing: 12,
                              children: const [
                                Text(
                                  "Units: 10",
                                  style: bBodyText2,
                                ),
                                Text(
                                  "Price: ₹100",
                                  style: bBodyText2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    alignment: Alignment.center,
                    child: ListTile(
                      horizontalTitleGap: 1,
                      leading: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SvgPicture.asset(
                          "assets/images/leading-icon.svg",
                          width: 32,
                          height: 32,
                        ),
                      ),
                      title: const Text(
                        "Service View",
                        style: bHeading4,
                      ),
                      subtitle: const Text(
                        "EMPLOYEE MANAGEMENT",
                        style: gBodyText2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
