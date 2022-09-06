import 'package:flutter/material.dart';
import 'package:flutter_application_11/screens.dart/comments.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskHistory extends StatelessWidget {
  const TaskHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          title: const Text(
            "Task History",
            style: kBodyText1,
          ),
          backgroundColor: const Color(0xff3157F6),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
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
              Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade400, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xffA51111),
                    child: SvgPicture.asset(
                      "assets/images/task-grey.svg",
                      color: const Color(0xffFFFFFF),
                    ),
                  ),
                  title: const Text(
                    "You changed the status of ABC A/C Repair to Assigned",
                    style: bBodyText1,
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade400, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xffF91C1C),
                    child: SvgPicture.asset(
                      "assets/images/task-grey.svg",
                      color: const Color(0xffFFFFFF),
                    ),
                  ),
                  title: const Text(
                    "You ended the Laptop Repair Task",
                    style: bBodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff3157F6),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Comments())));
          },
          child: SvgPicture.asset(
            "assets/images/comment-add-white.svg",
          ),
        ),
      ),
    );
  }
}
