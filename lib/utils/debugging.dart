import 'package:intl/intl.dart';

void debug(Object obj) {
  DateTime date = DateTime.now();
  DateFormat format = DateFormat('hh:mm:ss');
  print('[Split the bill] [${format.format(date)}] $obj');
}