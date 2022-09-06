import 'package:flutter/material.dart';
import 'package:flutter_application_11/screens.dart/service_report_details.dart';
import 'package:flutter_application_11/style.dart';

class ServiceReport extends StatefulWidget {
  const ServiceReport({Key? key}) : super(key: key);

  @override
  State<ServiceReport> createState() => _ServiceReportState();
}

class _ServiceReportState extends State<ServiceReport> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: const Color(0xff3157F6),
            title: const Text(
              "Service Report",
              style: kBodyText1,
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              const ServiceReportDetails())));
                },
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xff3157F6), Colors.white],
                        stops: [0.35, 0.35],
                        tileMode: TileMode.clamp,
                      ),
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ticket ID",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            "21548465",
                            style: bBodyText2,
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Date/Time",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            width: 68,
                          ),
                          Text(
                            "01-07-2022, 02:21 PM",
                            style: bBodyText2,
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Customer Name",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            width: 33,
                          ),
                          Text(
                            "Rajeev Ranjan",
                            style: bBodyText2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
