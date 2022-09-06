import 'package:flutter/material.dart';
import 'package:flutter_application_11/screens.dart/notification_page.dart';
import 'package:flutter_application_11/screens.dart/task_history.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/views/drawer/organisations.dart';
import 'package:flutter_application_11/views/drawer/ratings.dart';
import 'package:flutter_application_11/views/drawer/schedules.dart';
import 'package:flutter_application_11/views/drawer/service_report.dart';
import 'package:flutter_application_11/views/drawer/settings.dart';
import 'package:flutter_application_11/views/drawer/stock_available.dart';
import 'package:flutter_application_11/views/drawer/work_time.dart';
import 'package:flutter_application_11/views/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      color: const Color(0xff3157F6),
      width: double.infinity,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: const Text(
              "Rajeev Ranjan",
              style: kBodyText1,
            ),
            subtitle: const Text(
              "01/07/2022 03:57PM",
              style: kBodyText2,
            ),
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            trailing: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/images/close-white.svg")),
          ),
        ],
      ),
    );
  }
}

class DrawerItems extends StatefulWidget {
  const DrawerItems({super.key});

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const HomePage(
                            page: 0,
                          ))));
            },
            child: ListTile(
              title: const Text(
                "Home",
                style: bBodyText2,
              ),
              leading: SvgPicture.asset("assets/images/home1.svg"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const TaskHistory())));
            },
            child: ListTile(
              title: const Text(
                "Task History",
                style: bBodyText2,
              ),
              leading: SvgPicture.asset("assets/images/task-history.svg"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const WorkTime())));
            },
            child: ListTile(
              title: const Text(
                "Work Time",
                style: bBodyText2,
              ),
              leading: SvgPicture.asset("assets/images/work-time.svg"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const StockAvailable())));
            },
            child: ListTile(
              title: const Text(
                "Stock Availability",
                style: bBodyText2,
              ),
              leading: SvgPicture.asset("assets/images/stock-availability.svg"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Schedules())));
            },
            child: ListTile(
              title: const Text(
                "Schedules",
                style: bBodyText2,
              ),
              leading: SvgPicture.asset("assets/images/schedules.svg"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ServiceReport())));
            },
            child: ListTile(
              title: const Text(
                "Service Report",
                style: bBodyText2,
              ),
              leading: SvgPicture.asset("assets/images/service-report.svg"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const OrganisationsPage())));
            },
            child: ListTile(
              title: const Text(
                "Organisation",
                style: bBodyText2,
              ),
              leading: SvgPicture.asset("assets/images/organisation.svg"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Ratings())));
            },
            child: ListTile(
              title: const Text(
                "Ratings",
                style: bBodyText2,
              ),
              leading: SvgPicture.asset("assets/images/rating.svg"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const NotificationPage())));
            },
            child: ListTile(
              title: const Text(
                "Notifications",
                style: bBodyText2,
              ),
              leading: SvgPicture.asset("assets/images/home1.svg"),
            ),
          ),
          ListTile(
            title: const Text(
              "Share App",
              style: bBodyText2,
            ),
            leading: SvgPicture.asset("assets/images/share-app.svg"),
          ),
          InkWell(
            onTap: (() => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Settings())))),
            child: ListTile(
              title: const Text(
                "Settings",
                style: bBodyText2,
              ),
              leading: SvgPicture.asset("assets/images/setting.svg"),
            ),
          ),
          ListTile(
            title: const Text(
              "Logout",
              style: bBodyText2,
            ),
            leading: SvgPicture.asset("assets/images/logout.svg"),
          )
        ],
      ),
    );
  }
}
