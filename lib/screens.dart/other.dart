import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/widgets/enter_service_fee.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffFFFFFF),
            appBar: AppBar(
                backgroundColor: const Color(0xff3157F6),
                title: const Text(
                  "Other",
                  style: kBodyText1,
                )),
            body: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ]))));
  }
}
