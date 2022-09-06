import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';

class AddComments extends StatefulWidget {
  const AddComments({super.key});

  @override
  State<AddComments> createState() => _AddCommentsState();
}

class _AddCommentsState extends State<AddComments> {
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: const Color(0xff3157F6),
            title: const Text(
              "Write a Comment",
              style: kBodyText1,
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                height: 600,
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Write your comment here...",
                      enabledBorder: OutlineInputBorder()),
                  minLines: 200,
                  maxLines: 200,
                  keyboardType: TextInputType.multiline,
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: const Color(0xffFFFFFF),
                  primary: const Color(0xff3157F6),
                  minimumSize: const Size(double.infinity, 60),
                  textStyle: kBodyText,
                ),
                onPressed: (() {}),
                child: const Text("POST COMMENT"))
          ],
        ),
      ),
    );
  }
}
