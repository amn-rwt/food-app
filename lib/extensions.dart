import 'package:tiffin_app/constants/app_constants.dart';

extension DateTimeExtensions on DateTime {
  String get dateFromTimestamp => '${daysOfWeek[weekday - 1]} $day, $year';
}
