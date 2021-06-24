import 'package:intl/intl.dart';

final bool printDebug = false;

void debug(Object obj) {
  if(printDebug) {
    DateTime date = DateTime.now();
    DateFormat format = DateFormat('hh:mm:ss');
    print('[Split the bill] [${format.format(date)}] $obj');
  }
}