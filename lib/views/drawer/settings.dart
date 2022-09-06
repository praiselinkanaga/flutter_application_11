import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool on = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xff3157F6),
          title: const Text(
            "Settings",
            style: kBodyText1,
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Enable Notifications',
                  style: bBodyText,
                ),
                Transform.scale(
                  scale: 1,
                  child: Switch.adaptive(
                    activeColor: const Color(0xff3157F6),
                    activeTrackColor: const Color(0xff3157F6),
                    value: on,
                    onChanged: (value) {
                      setState(() {
                        on = value;
                      });
                    },
                  ),
                )
              ],
            ),
            const Divider(
              color: Color(0xffE4E4E4),
              thickness: 1,
              height: 30,
            ),
            const Text("App Info", style: bHeading3),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "App Version",
                    style: gBodyText2,
                  ),
                  Text(
                    "1.0",
                    style: bBodyText2,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Last Updated", style: gBodyText2),
                  Text("01 July 2022", style: bBodyText2),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Device ID", style: gBodyText2),
                  Text("2465v4dsvd6v35v4", style: bBodyText2),
                ],
              ),
            ),
            const Divider(
              color: Color(0xffE4E4E4),
              thickness: 1,
              height: 30,
            ),
            const Text(
              'About',
              style: bHeading3,
            ),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Text('Get Help', style: bBodyText2)),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Text('FAQ', style: bBodyText2)),
          ],
        ),
      ),
    );
  }
}
