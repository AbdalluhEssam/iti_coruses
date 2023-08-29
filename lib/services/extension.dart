import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension DateExtension on DateTime {
  String abbrDayWithNumber() {
    return DateFormat(DateFormat.ABBR_MONTH_DAY).format(this);
  }
  String toDetailedArabicDateWithTime(){
    return DateFormat(DateFormat.MONTH_WEEKDAY_DAY,"ar_SA").add_jms().format(this);
  }
//TODO: implement new method to get Weekday + day in numbers
}

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  NavigatorState get navigator => Navigator.of(this);
}

extension NumbersExtension on String {
  String toArabicNumbers() {
    return replaceAll("1", "١")
        .replaceAll("2", "٢")
        .replaceAll("3", "٣")
        .replaceAll("4", "٤")
        .replaceAll("5", "٥")
        .replaceAll("6", "٦")
        .replaceAll("7", "٧")
        .replaceAll("8", "٨")
        .replaceAll("9", "٩")
        .replaceAll("0", "٠");
  }

  String toLocaleNumbers(BuildContext context) {
    return context.locale.languageCode == "ar" ? toArabicNumbers() : this;
  }
}


