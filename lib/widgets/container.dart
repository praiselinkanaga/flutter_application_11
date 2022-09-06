import 'package:flutter/material.dart';
import 'package:flutter_application_11/Utils/data_utils.dart';
import 'package:flutter_application_11/models/tickets.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicketContainer extends StatefulWidget {
  final Tickets value;
  const TicketContainer({super.key, required this.value});

  @override
  State<TicketContainer> createState() => _TicketContainerState();
}

class _TicketContainerState extends State<TicketContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        top: 20,
        left: 20,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff0000004d), width: 2),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff0000004d).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1))
          ],
          color: const Color(0xffFFFFFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ticket ID: ${widget.value.ticketId}",
                  style: bBodyText2,
                ),
                Text(
                  dateTime(widget.value.createdAt.toString()),
                  style: gBodyText2,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Text(
                  "Status",
                  style: bBodyText3,
                ),
                SizedBox(
                  width: 140,
                ),
                Text(
                  "Priority",
                  style: bBodyText3,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: colorStatus(widget.value.status.statusId),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Text(
                  widget.value.status.statusName,
                  style: TextStyle(
                      fontSize: 12,
                      color: textColorStatus(widget.value.status.statusName)),
                ),
                const SizedBox(
                  width: 130,
                ),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: colorPriority(
                        widget.value.priorityStatus.priorityStatusId),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Text(
                  widget.value.priorityStatus.priorityStatusName,
                  style: TextStyle(
                      fontSize: 12,
                      color: textColorPriority(
                          widget.value.priorityStatus.priorityStatusName)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ticket Name",
                  style: bBodyText3,
                ),
                Text(
                  widget.value.taskName,
                  style: const TextStyle(
                      color: Color(0xff3157F6),
                      fontSize: 14,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/company-blue.svg"),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.value.companyName,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff000000),
                      decorationThickness: 2.0,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SvgPicture.asset("assets/images/user-blue.svg"),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.value.userName,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff000000),
                      decorationThickness: 2.0,
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
