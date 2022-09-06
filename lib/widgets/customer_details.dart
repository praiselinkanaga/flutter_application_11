import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: const Color(0xff3157F6),
            title: const Text(
              "Customer Details",
              style: kBodyText1,
            )),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Customer Name",
                style: bLBodyText1,
              ),
              Text(
                "Nikhil Moger",
                style: bBodyText1,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Phone Number",
                style: bLBodyText1,
              ),
              Text(
                "+91-6753084662",
                style: bBodyText1,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Address",
                style: bLBodyText1,
              ),
              Text(
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
