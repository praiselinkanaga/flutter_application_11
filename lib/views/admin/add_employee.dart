import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/views/admin/employee.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xffB226F6),
          title: const Text(
            "Add New Employee",
            style: kBodyText1,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "EMPLOYEE NAME",
                style: bBodyText1,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  helperText: "",
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
                style: kBodyText,
                keyboardType: TextInputType.text,
              ),
              const Text(
                "EMAIL",
                style: bBodyText1,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  helperText: "",
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
                style: kBodyText,
                keyboardType: TextInputType.emailAddress,
              ),
              Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xffF2F2F2),
                        backgroundColor: const Color(0xffAAAAAA),
                        minimumSize: const Size(180, 40),
                        textStyle: kBodyText,
                      ),
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Employee())));
                      }),
                      child: const Text("Cancel")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xffFFFFFF),
                        backgroundColor: const Color(0xffB226F6),
                        minimumSize: const Size(180, 40),
                        textStyle: kBodyText,
                      ),
                      onPressed: (() {}),
                      child: const Text("Create"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
