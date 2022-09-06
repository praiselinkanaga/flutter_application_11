import 'package:flutter/material.dart';
import 'package:flutter_application_11/screens.dart/add_comments.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: const Color(0xff3157F6),
            title: const Text(
              "Comments",
              style: kBodyText1,
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            children: const [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xffA51111),
                ),
                title: Text(
                  "Rupansh Bhakta",
                  style: bBodyText1,
                ),
                subtitle: Text("04 July 2022, 12:52 PM",
                    style: TextStyle(fontSize: 12)),
              ),
              SizedBox(
                width: 340,
                height: 100,
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xffB226F6),
                ),
                title: Text(
                  "Aditha Maradi",
                  style: bBodyText1,
                ),
                subtitle: Text(
                  "04 July 2022, 12:52 PM",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(
                width: 340,
                height: 100,
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xff14A70A),
                ),
                title: Text(
                  "Falguni Chandra",
                  style: bBodyText1,
                ),
                subtitle: Text("04 July 2022, 12:52 PM",
                    style: TextStyle(fontSize: 12)),
              ),
              SizedBox(
                width: 340,
                height: 100,
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: 600,
          child: FloatingActionButton.extended(
              backgroundColor: const Color(0xff3157F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AddComments())));
              }),
              icon: SvgPicture.asset("assets/images/comment-add-white.svg"),
              label: const Text(
                "Add your comment",
                style: kBodyText1,
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
