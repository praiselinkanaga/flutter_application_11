import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';

class SelectDepartment extends StatefulWidget {
  const SelectDepartment({super.key});

  @override
  State<SelectDepartment> createState() => _SelectDepartmentState();
}

class _SelectDepartmentState extends State<SelectDepartment> {
  List departments = [
    {"departmentName": "Technical", "departmentId": 1},
    {"departmentName": "Electronics", "departmentId": 2},
    {"departmentName": "Electrical", "departmentId": 3},
    {"departmentName": "Software", "departmentId": 4},
    {"departmentName": "Customer", "departmentId": 5},
    {"departmentName": "Mechanical", "departmentId": 6},
  ];
  List selectedDepartments = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          title: const Text(
            "Edit Profile",
            style: kBodyText,
          ),
          backgroundColor: const Color(0xff3157F6),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 30, left: 20),
                  child: Text(
                    "Select your department",
                    style: TextStyle(
                        color: Color(0xffAAAAAA),
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
              ...departments.map((e) => Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 20,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedDepartments.contains(e["departmentId"])) {
                            (selectedDepartments.remove(e["departmentId"]));
                          } else {
                            selectedDepartments.add(e["departmentId"]);
                          }
                        });
                        print(selectedDepartments);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                              selectedDepartments.contains(e["departmentId"])
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: selectedDepartments
                                      .contains(e['departmentId'])
                                  ? const Color(0xff3157F6)
                                  : const Color(0xffAAAAAA)),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              e['departmentName'],
                              style: bBodyText1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
