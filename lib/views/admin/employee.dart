import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/views/admin/add_employee.dart';

class Employee extends StatefulWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          children: const [
            Text(
              "Employees",
              style: bHeading3,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffB226F6),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const AddEmployee())));
          },
          child: const Icon(
            Icons.add,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
