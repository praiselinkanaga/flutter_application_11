import 'dart:ui';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/tickets.dart';

import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatefulWidget {
  final List<Tickets> tickets;
  const SearchPage({super.key, required this.tickets});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final countryPicker = const FlCountryCodePicker();
  final customerMobileNumberController = TextEditingController();
  final codeController = TextEditingController();
  final ticketIdController = TextEditingController();
  final customerNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Tickets> searchedTickets = [];

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        backgroundColor: Colors.white,
        //shadowColor: Colors.white,
        child: SingleChildScrollView(
          child: SizedBox(
            width: 600,
            height: 600,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Find My Task",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "CUSTOMER MOBILE NUMBER",
                          style: bBodyText2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: codeController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Field is Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffAAAAAA))),
                                    suffixIcon: GestureDetector(
                                      onTap: () async {
                                        final code =
                                            await countryPicker.showPicker(
                                                context: context,
                                                isFullScreen: true);

                                        if (code != null) print(code.dialCode);
                                        setState(() {
                                          codeController.text = code!.dialCode;
                                        });
                                      },
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: SvgPicture.asset(
                                          "assets/images/down-black.svg",
                                          width: 10,
                                          height: 10,
                                        ),
                                      ),
                                    )),
                                style: bBodyText2,
                                keyboardType: TextInputType.none,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 3,
                              child: TextFormField(
                                controller: customerMobileNumberController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Field is Required";
                                  }
                                  return null;
                                },
                                // onSaved: (value) {
                                //   setState(() {
                                //     customerMobileNumberController.text = value!;
                                //   });
                                // },
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffAAAAAA))),
                                ),
                                style: bBodyText2,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            "TICKET ID",
                            style: bBodyText2,
                          ),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            searchedTickets = widget.tickets
                                .where((element) => element.ticketId
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: ticketIdController,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                          style: bBodyText2,
                          keyboardType: TextInputType.text,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            "CUSTOMER NAME",
                            style: bBodyText2,
                          ),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            searchedTickets = widget.tickets
                                .where((element) => element.userName
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: customerNameController,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                          style: bBodyText2,
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  onPrimary: const Color(0xffAAAAAA),
                                  primary: const Color(0xffF2F2F2),
                                  minimumSize: const Size(140, 40),
                                  textStyle: bBodyText,
                                ),
                                onPressed: (() {}),
                                child: const Text("Reset")),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  onPrimary: const Color(0xffFFFFFF),
                                  primary: const Color(0xff3157F6),
                                  minimumSize: const Size(140, 40),
                                  textStyle: kBodyText,
                                ),
                                onPressed: (() {}),
                                child: const Text("Apply"))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
