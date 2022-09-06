import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';

class TicketDetails extends StatelessWidget {
  const TicketDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: const Color(0xff3157F6),
            title: const Text(
              "Ticket Details",
              style: kBodyText1,
            )),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Description",
                  style: bLBodyText1,
                ),
                Text(
                  "Customer purchased a portable laptop, model number LAPTOP XXX123. The hard disk keeps crashing repeatedly and the screen goes blank. Customer needs to get this solved as soon as possible.",
                  style: bBodyText1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Reported on",
                  style: bLBodyText1,
                ),
                Text("04 July 2022, 11:39 AM"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Closed on",
                  style: bLBodyText1,
                ),
                Text("04 July 2022, 11:39 AM"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Assigned by",
                  style: bLBodyText1,
                ),
                Text("Rudransh Hamchinamani"),
              ]),
        ),
      ),
    );
  }
}
