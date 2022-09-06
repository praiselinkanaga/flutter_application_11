import 'package:flutter/material.dart';
import 'package:flutter_application_11/providers/tickets_provider.dart';
import 'package:flutter_application_11/views/home/task_details.dart';
import 'package:flutter_application_11/widgets/container.dart';
import 'package:provider/provider.dart';

class ScheduledTask extends StatefulWidget {
  const ScheduledTask({Key? key}) : super(key: key);

  @override
  State<ScheduledTask> createState() => _ScheduledTaskState();
}

class _ScheduledTaskState extends State<ScheduledTask> {
  @override
  Widget build(BuildContext context) {
    final getTickets = Provider.of<TicketProvider>(context);
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getTickets.tickets!
            .where((element) =>
                element.status.statusName.toLowerCase() == "on hold")
            .toList()
            .length,
        itemBuilder: ((context, index) {
          var tick = getTickets.tickets!
              .where((element) =>
                  element.status.statusName.toLowerCase() == "on hold")
              .toList()[index];
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => TaskDetails(
                              value: tick,
                            ))));
              },
              child: TicketContainer(value: tick));
        }));
  }
}
