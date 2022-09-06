import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';

class OpenAdminNotification extends StatefulWidget {
  const OpenAdminNotification({super.key});

  @override
  State<OpenAdminNotification> createState() => _OpenAdminNotificationState();
}

class _OpenAdminNotificationState extends State<OpenAdminNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffB226F6),
        title: const Text(
          "Open Notification",
          style: kBodyText1,
        ),
      ),
      body: Column(
        children: const [
          ListTile(
            title: Text("Name"),
            subtitle: Text("Message"),
          )
        ],
      ),
    );
  }
}
