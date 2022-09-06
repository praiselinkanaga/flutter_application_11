import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/views/drawer/ratings.dart';
import 'package:flutter_application_11/views/home/edit-profile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Rajeev Ranjan",
                            style: bHeading4,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const Ratings())));
                            },
                            child: SmoothStarRating(
                              rating: 3,
                              color: const Color(0xffE5BB12),
                              borderColor: const Color(0xffE5BB12),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      Hero(
                        tag: "profile",
                        child: Stack(children: [
                          const Positioned(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            left: 50,
                            child: CircleAvatar(
                              backgroundColor: const Color(0xff3157F6),
                              radius: 15,
                              child: SvgPicture.asset("assets/images/edit.svg"),
                            ),
                          ),
                        ]),
                      )
                    ]),
              ),
              const Divider(
                color: Color(0xffE4E4E4),
                indent: 20,
                endIndent: 20,
                thickness: 1,
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Contact Number",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffAAAAAA),
                      ),
                    ),
                    Text("+91-8141205424", style: bBodyText1),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffAAAAAA),
                      ),
                    ),
                    Text("rajeevranjan@gmail.com", style: bBodyText1),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffAAAAAA),
                      ),
                    ),
                    Text(
                      "Male",
                      style: bBodyText1,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Department",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffAAAAAA),
                      ),
                    ),
                    Text("Technical, Electrical, Software", style: bBodyText1),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const EditProfile())));
            },
            backgroundColor: const Color(0xff000000),
            child: SvgPicture.asset("assets/images/edit.svg")),
      ),
    );
  }
}
