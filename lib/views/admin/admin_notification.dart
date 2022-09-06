import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';

class AdminNotificationPage extends StatefulWidget {
  const AdminNotificationPage({super.key});

  @override
  State<AdminNotificationPage> createState() => _AdminNotificationPageState();
}

class _AdminNotificationPageState extends State<AdminNotificationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffB226F6),
        title: const Text(
          "Notification",
          style: kBodyText1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Card(
              color: Colors.white24,
              child: ListTile(
                title: Text("Name"),
                subtitle: Text("Message"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
