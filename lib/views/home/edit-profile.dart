import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/views/home/change_password.dart';
import 'package:flutter_application_11/views/home/select.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int _value = 1;
  final countryPicker = const FlCountryCodePicker();
  final contactNumberController = TextEditingController();
  final codeController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final departmentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      child: Hero(
                        tag: "profile",
                        child: Stack(children: [
                          const Positioned(
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            left: 100,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: const Color(0xff3157F6),
                              child: SvgPicture.asset("assets/images/edit.svg"),
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("CONTACT NUMBER"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 1,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  helperText: "",
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
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
                                    child: Container(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: SvgPicture.asset(
                                          "assets/images/down-grey.svg",
                                          width: 15,
                                          height: 15,
                                        ),
                                      ),
                                    ),
                                  )),
                              readOnly: true,
                              keyboardType: TextInputType.none,
                              style: bBodyText1,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          flex: 3,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: contactNumberController,
                            decoration: const InputDecoration(
                              helperText: "",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                            style: bBodyText1,
                            readOnly: true,
                            keyboardType: TextInputType.none,
                          ),
                        )
                      ],
                    ),
                    const Text(
                      "FULL NAME",
                      style: bBodyText1,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                      decoration: const InputDecoration(
                        helperText: "",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      style: bBodyText2,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "EMAIL",
                      style: bBodyText1,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                      decoration: const InputDecoration(
                        helperText: "",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      style: bBodyText2,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "GENDER",
                      style: bBodyText1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          "Male",
                          style: bBodyText1,
                        ),
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
                          "Female",
                          style: bBodyText1,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        "DEPARTMENT",
                        style: bBodyText1,
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        suffixIcon: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const SelectDepartment())));
                          },
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: SvgPicture.asset(
                              "assets/images/down-black.svg",
                              width: 15,
                              height: 15,
                            ),
                          ),
                        ),
                      ),
                      style: bBodyText1,
                      keyboardType: TextInputType.none,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const ChangePassword())));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 50,
                        color: const Color(0xffF2F2F2),
                        child: ListTile(
                          title: const Text(
                            "Change Password",
                            style: TextStyle(
                              color: Color(0xff3157F6),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          leading: SvgPicture.asset("assets/images/lock.svg"),
                          trailing: SvgPicture.asset("assets/images/arrow.svg"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onPrimary: const Color(0xffAAAAAA),
                                primary: const Color(0xffF2F2F2),
                                minimumSize: const Size(170, 60),
                                textStyle: kBodyText,
                              ),
                              onPressed: (() {}),
                              child: const Text("CANCEL")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onPrimary: const Color(0xffFFFFFF),
                                primary: const Color(0xff3157F6),
                                minimumSize: const Size(170, 60),
                                textStyle: kBodyText,
                              ),
                              onPressed: (() {}),
                              child: const Text("SAVE"))
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
