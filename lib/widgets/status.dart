import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 450,
        height: 400,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Change Status",
                    style: bHeading2,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/images/close.svg")),
                ],
              ),
              Row(
                children: [
                  Radio(
                      activeColor: const Color(0xff3157F6),
                      value: 1,
                      groupValue: _value,
                      onChanged: ((value) {
                        setState(() {
                          _value = _value;
                        });
                      })),
                  const Text(
                    "Open",
                    style: bBodyText1,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                      activeColor: const Color(0xff3157F6),
                      value: 2,
                      groupValue: _value,
                      onChanged: ((value) {
                        setState(() {
                          _value = _value;
                        });
                      })),
                  const Text(
                    "Assigned",
                    style: bBodyText1,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                      activeColor: const Color(0xff3157F6),
                      value: 2,
                      groupValue: _value,
                      onChanged: ((value) {
                        setState(() {
                          _value = _value;
                        });
                      })),
                  const Text(
                    "In-Progress",
                    style: bBodyText1,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                      activeColor: const Color(0xff3157F6),
                      value: 2,
                      groupValue: _value,
                      onChanged: ((value) {
                        setState(() {
                          _value = _value;
                        });
                      })),
                  const Text(
                    "On Hold",
                    style: bBodyText1,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                      activeColor: const Color(0xff3157F6),
                      value: 2,
                      groupValue: _value,
                      onChanged: ((value) {
                        setState(() {
                          _value = _value;
                        });
                      })),
                  const Text(
                    "Closed",
                    style: bBodyText1,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: const Color(0xffAAAAAA),
                        onSurface: const Color(0xffF2F2F2),
                        minimumSize: const Size(120, 40),
                        textStyle: kBodyText1,
                      ),
                      onPressed: (() {}),
                      child: const Text("CANCEL")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: const Color(0xffFFFFFF),
                        onSurface: const Color(0xff3157F6),
                        minimumSize: const Size(120, 40),
                        textStyle: kBodyText1,
                      ),
                      onPressed: (() {}),
                      child: const Text("SAVE"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
