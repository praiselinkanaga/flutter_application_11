import 'package:flutter/material.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_application_11/widgets/enter_service_fee.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

class Reschedule extends StatefulWidget {
  const Reschedule({super.key});

  @override
  State<Reschedule> createState() => _RescheduleState();
}

class _RescheduleState extends State<Reschedule> {
  bool check = false;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: const Color(0xff3157F6),
            title: const Text(
              "Reschedule",
              style: kBodyText1,
            )),
        body: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime(1990),
                lastDay: DateTime(2050),
                calendarFormat: format,
                onFormatChanged: (CalendarFormat format) {
                  setState(() {
                    format = format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,
                //Day change
                selectedDayPredicate: (date) {
                  return isSameDay(selectedDay, date);
                },
                onDaySelected: (selectDay, focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                  print(focusedDay);
                  print(selectedDay);
                },
                // calendar style
                calendarStyle: const CalendarStyle(
                    isTodayHighlighted: true,
                    selectedTextStyle: kBodyText,
                    todayTextStyle: bBodyText,
                    selectedDecoration: BoxDecoration(
                      color: Color(0xff3157F6),
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                        color: Color(0xffF2F2F2), shape: BoxShape.rectangle),
                    weekendTextStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xffAAAAAA),
                        fontSize: 18),
                    defaultTextStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xffAAAAAA),
                        fontSize: 18)),
                daysOfWeekStyle:
                    const DaysOfWeekStyle(weekdayStyle: bBodyText1),
                daysOfWeekHeight: 25,
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: bBodyText,
                    headerPadding: const EdgeInsets.symmetric(vertical: 10),
                    leftChevronIcon:
                        SvgPicture.asset("assets/images/arrow-back-left.svg"),
                    leftChevronPadding: const EdgeInsets.only(left: 1),
                    rightChevronIcon:
                        SvgPicture.asset("assets/images/arrow-back-right.svg"),
                    rightChevronPadding: const EdgeInsets.only(right: 1)),
              ),
              const Divider(
                color: Color(0xffE4E4E4),
                thickness: 1,
                height: 30,
              ),
              const Spacer(),
              Wrap(
                spacing: 12,
                children: [
                  Checkbox(
                      value: check,
                      onChanged: ((value) {
                        setState(() {
                          //check.value = check.value;
                        });
                      })),
                  const Text(
                    "Assign",
                    style: bBodyText1,
                  ),
                ],
              ),
              // ListTile(
              //   leading: Checkbox(
              //       value: check,
              //       onChanged: ((value) {
              //         setState(() {
              //           //check.value = check.value;
              //         });
              //       })),
              //   title: const Text(
              //     "Assign",
              //     style: bBodyText1,
              //   ),
              // ),
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
            ])));
  }
}
