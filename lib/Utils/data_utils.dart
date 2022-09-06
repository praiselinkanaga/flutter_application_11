import 'package:intl/intl.dart';

dateTime(time) {
  var date = DateFormat("dd-MMM-yyyy, hh:mm a").format(DateTime.parse(time));
  return date.toString();
}
