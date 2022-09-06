import 'package:flutter/material.dart';
import 'package:flutter_application_11/Utils/data_utils.dart';
import 'package:flutter_application_11/models/tickets.dart';
import 'package:flutter_application_11/screens.dart/task_history.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/widgets/company_details.dart';
import 'package:flutter_application_11/widgets/customer_details.dart';
import 'package:flutter_application_11/widgets/ticket_details.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskDetails extends StatefulWidget {
  final Tickets value;
  const TaskDetails({super.key, required this.value});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  int index = 0;
  Color buttonColor = const Color(0xff2AC120);
  var changeText = "START TASK";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xff3157F6),
          title: const Text(
            "Task Details",
            style: kBodyText1,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Ticket ID",
                            style: bLBodyText1,
                          ),
                          Text(
                            widget.value.ticketId,
                            style: bBodyText,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Task Date & Time",
                            style: bLBodyText1,
                          ),
                          Text(
                            dateTime(widget.value.createdAt.toString()),
                            style: bBodyText,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Status",
                            style: bLBodyText1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 140,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Priority",
                            style: bLBodyText1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: colorPriority(widget
                                      .value.priorityStatus.priorityStatusId),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.value.priorityStatus.priorityStatusName,
                                style: TextStyle(
                                    color: textColorPriority(widget.value
                                        .priorityStatus.priorityStatusName)),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const Text(
                  //   "Current Status",
                  //   style: bLBodyText1,
                  // ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     onPrimary: Colors.white,
                  //     primary: colorStatus(widget.value.status.statusId),
                  //     minimumSize: const Size(double.infinity, 30),
                  //     textStyle: kBodyText1,
                  //   ),
                  //   onPressed: (() {
                  //     showModalBottomSheet(
                  //         context: context,
                  //         backgroundColor: Colors.transparent,
                  //         builder: ((context) => const StatusPage()));
                  //   }),
                  //   child: Text(
                  //     widget.value.status.statusName,
                  //     style: TextStyle(
                  //         color:
                  //             textColorStatus(widget.value.status.statusName)),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CustomerDetails())));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Colors.grey.shade400, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.only(top: 20),
                      child: ListTile(
                        title: const Text(
                          "Customer Name",
                          style: bLBodyText1,
                        ),
                        subtitle: Text(
                          widget.value.userName,
                          style: bBodyText,
                        ),
                        trailing:
                            SvgPicture.asset("assets/images/black-down.svg"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CompanyDetails())));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Colors.grey.shade400, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.only(top: 20),
                      child: ListTile(
                        title: const Text(
                          "Company Name",
                          style: bLBodyText1,
                        ),
                        subtitle: Text(
                          widget.value.companyName,
                          style: bBodyText,
                        ),
                        trailing:
                            SvgPicture.asset("assets/images/black-down.svg"),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => const MapPage())));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Colors.grey.shade400, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        "assets/images/map.jpeg",
                        width: 400,
                        height: 200,
                      ),
                      //child: MapPage(),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const TicketDetails())));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Colors.grey.shade400, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.only(top: 20),
                      child: ListTile(
                        title: const Text(
                          "Ticket Name",
                          style: bLBodyText1,
                        ),
                        subtitle: Text(
                          widget.value.taskName,
                          style: bBodyText,
                        ),
                        trailing:
                            SvgPicture.asset("assets/images/black-down.svg"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const TaskHistory())));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Colors.grey.shade400, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.only(top: 20),
                      child: ListTile(
                        title: const Text(
                          "View Task History",
                          style: bLBodyText1,
                        ),
                        leading:
                            SvgPicture.asset("assets/images/blue-task.svg"),
                        trailing: SvgPicture.asset(
                            "assets/images/black-arrow-back.svg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: FloatingActionButton.extended(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: (() {
              setState(() {
                index++;

                if (index == 1) {
                  buttonColor = const Color(0xffF91C1C);
                  changeText = "END TASK";
                }
                if (index == 2) {
                  Navigator.pop(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: ((context) => Tasks(
                  //               tickets: ,
                  //             ))));
                }
              });
            }),
            label: Text(
              changeText,
              style: kBodyText1,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }
}
