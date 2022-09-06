import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/tickets.dart';
import 'package:flutter_application_11/services/ticket_services.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/views/home/home.dart';
import 'package:flutter_application_11/views/home/task_details.dart';
import 'package:flutter_application_11/widgets/container.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "Task Summary",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180,
                    height: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffD6F8EA),
                    ),
                    child: ListTile(
                      title: Text(
                        13.toString(),
                        style: bHeading1,
                        textAlign: TextAlign.center,
                      ),
                      subtitle: const Text(
                        "Total task",
                        style: bBodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffFFDBDB),
                    ),
                    child: ListTile(
                      title: Text(
                        8.toString(),
                        style: bHeading1,
                        textAlign: TextAlign.center,
                      ),
                      subtitle: const Text(
                        "Open tasks due today",
                        style: bBodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180,
                    height: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffD2DBFF),
                    ),
                    child: ListTile(
                      title: Text(
                        3.toString(),
                        style: bHeading1,
                        textAlign: TextAlign.center,
                      ),
                      subtitle: const Text(
                        "Tasks completed today",
                        style: bBodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffFFF3D9),
                    ),
                    child: ListTile(
                      title: Text(
                        2.toString(),
                        style: bHeading1,
                        textAlign: TextAlign.center,
                      ),
                      subtitle: const Text(
                        "Hold tasks due today",
                        style: bBodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
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
                    width: 80,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff3157f629),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: const Duration(seconds: 1),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  final slideAnimation = Tween(
                                          begin: const Offset(0, 1),
                                          end: const Offset(0, 0))
                                      .animate(animation);
                                  return SlideTransition(
                                    position: slideAnimation,
                                    child: child,
                                  );
                                },
                                pageBuilder:
                                    ((context, animation, secondaryAnimation) =>
                                        const HomePage(
                                          page: 1,
                                        ))));
                        // MaterialPageRoute(
                        //     builder: ((context) => const HomePage(
                        //           page: 1,
                        //         ))));
                      },
                      child: const Text(
                        "View All",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff3157F6),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const DashboardItems(),
          ],
        ),
      )),
    );
  }
}

class DashboardItems extends StatefulWidget {
  const DashboardItems({super.key});

  @override
  State<DashboardItems> createState() => _DashboardItemsState();
}

class _DashboardItemsState extends State<DashboardItems> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tickets>>(
        future: TicketService().getData(),
        builder: ((context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => TaskDetails(
                                      value: snapshot.data![index],
                                    ))));
                      },
                      child: TicketContainer(value: snapshot.data![index]));
                }));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }));
  }
}
