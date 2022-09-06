import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:pie_chart/pie_chart.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final dataMap = <String, double>{
    "Tickets Resolved Till Date": 20,
    "On Hold Tickets": 16,
    "Open Tickets": 02,
  };
  final colorList = <Color>[
    const Color(0xff2AC120),
    const Color(0xffB226F6),
    const Color(0xff3157F6),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "Overview",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180,
                    height: 140,
                    margin: const EdgeInsets.only(right: 10),
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
                        "Total Employees",
                        style: bBodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 140,
                    // margin: const EdgeInsets.only(right: 3),
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
                        "No. of Employees Assigned",
                        style: bBodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180,
                    height: 140,
                    margin: const EdgeInsets.only(right: 10),
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
                        "No. of Employees Unassigned",
                        style: bBodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 140,
                    margin: const EdgeInsets.only(right: 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff2ac120),
                    ),
                    child: ListTile(
                      title: Text(
                        10.toString(),
                        style: bHeading1,
                        textAlign: TextAlign.center,
                      ),
                      subtitle: const Text(
                        "On-Duty Employees",
                        style: bBodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffaaaaaa),
                    ),
                    child: ListTile(
                      title: Text(
                        2.toString(),
                        style: bHeading1,
                        textAlign: TextAlign.center,
                      ),
                      subtitle: const Text(
                        "Off-Duty Employees",
                        style: bBodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PieChart(
                dataMap: dataMap,
                chartType: ChartType.ring,
                colorList: colorList,
                centerText: "02 July 2022",
                chartRadius: 180,
                legendOptions: const LegendOptions(
                  showLegendsInRow: true,
                  legendPosition: LegendPosition.bottom,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
