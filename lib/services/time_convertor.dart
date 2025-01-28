import 'package:intl/intl.dart';

String timeConvertor(String dateTime, String utcOffset) {
  DateTime now = DateTime.parse(dateTime);
  now = now.add(Duration(hours: int.parse(utcOffset)));
  return DateFormat.jm().format(now);
}
