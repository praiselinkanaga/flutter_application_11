import 'package:flutter/material.dart';
import 'package:flutter_application_11/Utils/data_utils.dart';
import 'package:flutter_application_11/models/tickets.dart';
import 'package:flutter_application_11/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

class Schedules extends StatefulWidget {
  const Schedules({Key? key}) : super(key: key);

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            backgroundColor: const Color(0xff3157F6),
            title: const Text(
              "Schedules",
              style: kBodyText1,
            )),
        body: Container(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      rightChevronIcon: SvgPicture.asset(
                          "assets/images/arrow-back-right.svg"),
                      rightChevronPadding: const EdgeInsets.only(right: 1)),
                ),
                const Divider(
                  color: Color(0xffE4E4E4),
                  thickness: 1,
                  height: 30,
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 5, top: 10),
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xff0000004d), width: 2),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff0000004d).withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1))
                    ],
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.amber,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Rajeev Ranjan"),
                          Spacer(),
                          Text("01-07-2022, 02:21 PM"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 30,
                            color: Colors.yellow,
                            alignment: Alignment.center,
                            child: const Text("Medium",
                                style: TextStyle(color: Colors.amber)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 100,
                            height: 30,
                            color: Colors.blue,
                            alignment: Alignment.center,
                            child: const Text(
                              "Open",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
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
    );
  }
}
