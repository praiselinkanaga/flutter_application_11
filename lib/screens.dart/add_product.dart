import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/widgets/enter_service_fee.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: const Color(0xff3157F6),
            title: const Text(
              "Add Product",
              style: kBodyText1,
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Write your reason here...",
                    hintStyle: gBodyText2,
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "PRODUCT NAME",
                  style: bBodyText1,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffAAAAAA))),
                  suffixIcon: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        "assets/images/down-black.svg",
                        width: 15,
                        height: 15,
                      )),
                ),
                style: bBodyText2,
                keyboardType: TextInputType.text,
              ),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: const Color(0xffFFFFFF),
                    primary: const Color(0xffF91C1C),
                    minimumSize: const Size(370, 60),
                    textStyle: kBodyText1,
                  ),
                  onPressed: (() {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: ((context) => const ServiceFee()));
                  }),
                  child: const Text("END TASK"))
            ],
          ),
        ),
      ),
    );
  }
}
