import 'package:flutter/material.dart';

//////////White
const TextStyle kHeading = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Color(0xffFFFFFF),
  letterSpacing: 2,
);

const TextStyle kHeading1 = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Color(0xffFFFFFF),
  letterSpacing: 0.1,
);

const TextStyle kHeading2 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color(0xffFFFFFF),
  letterSpacing: 0.1,
);

const TextStyle kHeading3 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Color(0xffFFFFFF),
  letterSpacing: 0.1,
);

const TextStyle kBodyText = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: Color(0xffFFFFFF),
  letterSpacing: 0.1,
);

const TextStyle kBodyText1 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xffFFFFFF),
);

const TextStyle kBodyText2 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xffFFFFFF),
);
//////////// Black
const TextStyle bHeading = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Color(0xff000000),
  letterSpacing: 2,
);

const TextStyle bHeading1 = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Color(0xff000000),
  letterSpacing: 1,
);

const TextStyle bHeading2 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color(0xff000000),
  letterSpacing: 1,
);

const TextStyle bHeading3 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Color(0xff000000),
  letterSpacing: 0.5,
);

const TextStyle bHeading4 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Color(0xff000000),
  letterSpacing: 0.5,
);

const TextStyle bBodyText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Color(0xff000000),
  letterSpacing: 0.1,
);

const TextStyle bBodyText1 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xff000000),
);

const TextStyle bBodyText2 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xff000000),
);
const TextStyle bBodyText3 = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w400,
  color: Color(0xff000000),
);
///// Blue
const TextStyle bLBodyText = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: Color(0xff3157F6),
  letterSpacing: 0.1,
);

const TextStyle bLBodyText1 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xff3157F6),
);

const TextStyle bLBodyText2 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xff3157F6),
);

const TextStyle bLUBodyText1 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xff3157F6),
  decoration: TextDecoration.underline,
  decorationColor: Color(0xff3157F6),
  decorationThickness: 3.0,
);

const TextStyle bLUBodyText2 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xff3157F6),
  decoration: TextDecoration.underline,
  decorationColor: Color(0xff3157F6),
  decorationThickness: 3.0,
);
///// Grey
const TextStyle gBodyText = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: Color(0xffAAAAAA),
  letterSpacing: 0.1,
);

const TextStyle gBodyText1 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xffAAAAAA),
);

const TextStyle gBodyText2 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xffAAAAAA),
);

Color colorPriority(priorityStatusId) {
  if (priorityStatusId == "1") {
    return const Color(0xffF91C1C);
  } else if (priorityStatusId == "2") {
    return const Color(0xffE5BB12);
  } else if (priorityStatusId == "3") {
    return const Color(0xff2AC120);
  }
  return Colors.grey;
}

Color textColorPriority(priorityStatusName) {
  Color colorForStatus = Colors.black;
  if (priorityStatusName == "High") {
    colorForStatus = const Color(0xffF91C1C);
  }
  if (priorityStatusName == "Medium") {
    colorForStatus = const Color(0xffE5BB12);
  }
  if (priorityStatusName == "Low") {
    colorForStatus = const Color(0xff2AC120);
  }

  return colorForStatus;
}

Color colorStatus(statusId) {
  // print(statusId);
  Color colorOfStatus = Colors.blueGrey;
  if (statusId == "1") {
    colorOfStatus = const Color(0xff3157F6);
  }
  if (statusId == "2") {
    colorOfStatus = const Color(0xffA51111);
  }
  if (statusId == "3") {
    colorOfStatus = const Color(0xffEF9917);
  }
  if (statusId == "4") {
    colorOfStatus = const Color(0xff8D29FF);
  }
  if (statusId == "5") {
    colorOfStatus = Colors.green;
  }
  return colorOfStatus;
}

Color textColorStatus(statusName) {
  Color colorForStatus = Colors.black;
  if (statusName == "Open") {
    colorForStatus = const Color(0xff3157F6);
  }
  if (statusName == "Assigned") {
    colorForStatus = const Color(0xffFFFFFF);
  }
  if (statusName == "In-Progress") {
    colorForStatus = const Color(0xffEF9917);
  }
  if (statusName == "On Hold") {
    colorForStatus = const Color(0xff8D29FF);
  }
  if (statusName == "Closed") {
    colorForStatus = const Color(0xffFFFFFF);
  }
  return colorForStatus;
}
