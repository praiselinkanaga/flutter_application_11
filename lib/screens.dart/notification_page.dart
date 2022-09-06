import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xff3157F6),
          title: const Text(
            "Notifications",
            style: kBodyText1,
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 100,
                  child: Divider(
                    color: Color(0xffE4E4E4),
                    thickness: 1,
                    height: 30,
                  ),
                ),
                Container(
                  width: 170,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xffF2F2F2),
                  ),
                  child: const Text(
                    "Today",
                    style: bBodyText2,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 100,
                  child: Divider(
                    color: Color(0xffE4E4E4),
                    thickness: 1,
                    height: 30,
                  ),
                ),
              ],
            ),
            const ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.amber,
              ),
              title: Text(
                "You have a new task!",
                style: bHeading3,
              ),
              subtitle: Text(
                "02-07-2022",
                style: gBodyText2,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 95),
              child: SizedBox(
                width: 270,
                height: 70,
                child: Text(
                  "You got assigned to Task Id 12345 for Laptop repair",
                  style: gBodyText1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 95),
              child: Row(
                children: const [
                  Text(
                    "VIEW",
                    style: bLUBodyText2,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "ACCEPT",
                    style: bLUBodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
