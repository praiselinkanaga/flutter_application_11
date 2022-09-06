import 'package:flutter/material.dart';
import 'package:flutter_application_11/providers/tickets_provider.dart';

import 'package:flutter_application_11/widgets/filter.dart';
import 'package:flutter_application_11/widgets/new.dart';
import 'package:flutter_application_11/widgets/progress.dart';
import 'package:flutter_application_11/widgets/scheduled.dart';
import 'package:flutter_application_11/widgets/search.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final getTickets = Provider.of<TicketProvider>(context, listen: false);
    getTickets.getTicketData();
  }

  @override
  Widget build(BuildContext context) {
    final getTickets = Provider.of<TicketProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Tasks",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                    Container(
                        width: 20,
                        height: 20,
                        color: const Color(0xffc4d1f5),
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: InkWell(
                              onTap: () {
                                showFilterDialog(context);
                              },
                              child: SvgPicture.asset(
                                "assets/images/filter-blue.svg",
                                width: 15,
                                height: 15,
                              ),
                            ))),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  child: TabBar(
                      controller: _tabController,
                      labelColor: const Color(0xff3157F6),
                      unselectedLabelColor: const Color(0xffAAAAAA),
                      indicatorColor: const Color(0xff3157F6),
                      indicatorPadding:
                          const EdgeInsets.only(left: 10, right: 10),
                      indicatorWeight: 5,
                      tabs: const [
                        Tab(
                          text: "New",
                        ),
                        Tab(
                          text: "In-Progress",
                        ),
                        Tab(
                          text: "Scheduled",
                        ),
                      ]),
                ),
              ),
              //Text(tickets.toString()),
              // Text(tickets[0].status.statusName),
              // Text(tickets[0].status.statusName.toLowerCase()),
              // Text((tickets[0].status.statusName.toLowerCase() == "open")
              //     .toString()),

              SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: TabBarView(controller: _tabController, children: const [
                  Newtask(),
                  InProgressTask(),
                  ScheduledTask(),
                ]),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showSearchDialog(context);
          },
          backgroundColor: const Color(0xff000000),
          child: SvgPicture.asset("assets/images/search-task-white.svg"),
        ),
      ),
    );
  }

  void showFilterDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: true,
      builder: ((context) {
        return const FilterPage();
      }));

  void showSearchDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return const SearchPage(
            tickets: [],
          );
        },
      );
}
