import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkTime extends StatefulWidget {
  const WorkTime({Key? key}) : super(key: key);

  @override
  State<WorkTime> createState() => _WorkTimeState();
}

class _WorkTimeState extends State<WorkTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xff3157F6),
          title: const Text(
            "Work Time",
            style: kBodyText1,
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff3157F6),
                        child: SvgPicture.asset(
                          "assets/images/timer-blue.svg",
                          width: 25,
                          height: 25,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Date",
                            style: bLBodyText2,
                          ),
                          Text(
                            "04 July 2022",
                            style: bBodyText2,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Duration",
                            style: bLBodyText2,
                          ),
                          Text(
                            "10 hrs : 37 mins",
                            style: bBodyText2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 91),
                            child: Text(
                              "Log in Time",
                              style: bLBodyText2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 91),
                            child: Text(
                              "09:00 AM",
                              style: bBodyText2,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "Log out Time",
                              style: bLBodyText2,
                            ),
                          ),
                          Text(
                            "07:37 PM",
                            style: bBodyText2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
