import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: const Color(0xff3157F6),
            title: const Text(
              "ABC Enterprises",
              style: kBodyText1,
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Organiser Name",
                style: bLBodyText1,
              ),
              const Text(
                "Rupansh Murti",
                style: bBodyText1,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Phone Number",
                    style: bLBodyText1,
                  ),
                  SvgPicture.asset("assets/images/copy-grey.svg"),
                ],
              ),
              const Text(
                "+91-6753084662",
                style: bBodyText1,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Organisation Address",
                style: bLBodyText1,
              ),
              const Text(
                "House No. 98, Near Shivam Sabhagruh, Tivadi C. H. Society, Part No. 36, Shekhdi Garh, Nagaur, Rajasthan, Pincode-368337",
                style: bBodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
