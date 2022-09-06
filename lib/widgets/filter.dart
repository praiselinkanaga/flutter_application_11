import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/svg.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List priorityStatus = [
    {"priorityStatusName": "High", "priorityStatusId": 1},
    {"priorityStatusName": "Medium", "priorityStatusId": 2},
    {"priorityStatusName": "Low", "priorityStatusId": 3},
  ];
  List selectedPriorityStatus = [];

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
            backgroundColor: const Color(0xff3157F6),
            //shadowColor: Colors.white,
            child: SizedBox(
                width: 600,
                height: 600,
                // decoration:
                //     BoxDecoration(borderRadius:BorderRadius.all(20)),
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Filter by", style: kBodyText),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Priority",
                              style: kBodyText1,
                            ),
                          ),
                          ...priorityStatus.map((e) => Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedPriorityStatus
                                          .contains(e["priorityStatusId"])) {
                                        (selectedPriorityStatus
                                            .remove(e["priorityStatusId"]));
                                      } else {
                                        selectedPriorityStatus
                                            .add(e["priorityStatusId"]);
                                      }
                                    });
                                    print(selectedPriorityStatus);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                          selectedPriorityStatus.contains(
                                                  e["priorityStatusId"])
                                              ? Icons.check_box
                                              : Icons.check_box_outline_blank,
                                          color:
                                              selectedPriorityStatus.contains(
                                                      e["priorityStatusId"])
                                                  ? const Color(0xffFFFFFF)
                                                  : const Color(0xffFFFFFF)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          e["priorityStatusName"],
                                          style: kBodyText2,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Date",
                              style: kBodyText1,
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFFFFF))),
                                hintText: "DD/MM/YYYY",
                                hintStyle: kBodyText2,
                                suffixIcon: Container(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: SvgPicture.asset(
                                      "assets/images/calendar-white.svg",
                                      width: 15,
                                      height: 15,
                                    ),
                                  ),
                                )),
                          ),
                          const Spacer(),
                          // const SizedBox(
                          //   height: 100,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: const Color(0xffFFFFFF),
                                    backgroundColor: Colors.white38,
                                    minimumSize: const Size(140, 40),
                                    textStyle: kBodyText,
                                  ),
                                  onPressed: (() {}),
                                  child: const Text("Reset")),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: const Color(0xff3157F6),
                                    backgroundColor: const Color(0xffFFFFFF),
                                    minimumSize: const Size(140, 40),
                                    textStyle: bLBodyText,
                                  ),
                                  onPressed: (() {}),
                                  child: const Text("Apply"))
                            ],
                          ),
                        ])))));
  }
}
