import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String abbrDayWithNumber() {
    return DateFormat(DateFormat.ABBR_MONTH_DAY).format(this);
  }
  //TODO: implement new method to get Weekday + day in numbers
}

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  
  NavigatorState get navigator =>  Navigator.of(this);
}
