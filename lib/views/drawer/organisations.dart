import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';

class OrganisationsPage extends StatefulWidget {
  const OrganisationsPage({super.key});

  @override
  State<OrganisationsPage> createState() => _OrganisationsPageState();
}

class _OrganisationsPageState extends State<OrganisationsPage> {
  List organisations = [
    {"organisationName": "ABC Enterprises", "organisationId": 1},
    {"organisationName": "Haldiram's Org", "organisationId": 2},
    {"organisationName": "CBI Group", "organisationId": 3},
    {"organisationName": "Aptify Inc.", "organisationId": 4},
  ];
  List selectedOrganisations = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xff3157F6),
          title: const Text(
            "Organisations",
            style: kBodyText1,
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...organisations.map((e) => GestureDetector(
                  onTap: (() {
                    if (selectedOrganisations.contains(e["organisationId"])) {
                      (selectedOrganisations.remove(e["organisationId"]));
                    } else {
                      selectedOrganisations.add(e["organisationId"]);
                    }
                    print(selectedOrganisations);
                  }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                          selectedOrganisations.contains(e["organisationId"])
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: selectedOrganisations
                                  .contains(e['organisationId'])
                              ? const Color(0xff3157F6)
                              : const Color(0xffAAAAAA)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          e['organisationName'],
                          style: bBodyText1,
                        ),
                      ),
                      const Text(
                        "01 July 2022",
                        style: gBodyText2,
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
