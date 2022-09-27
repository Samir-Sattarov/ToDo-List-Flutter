import 'package:intl/intl.dart';

class DateTimeHelper {
  static String format(DateTime time) {
    String result = DateFormat('h:mm').format(time);
    return result;
  }

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }
}
