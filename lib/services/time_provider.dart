import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tiffin_app/constants/app_constants.dart';
import 'package:tiffin_app/services/date_time_services.dart';

class CurrentTime extends StatefulWidget {
  const CurrentTime({super.key, required this.child});

  final Widget child;

  static DateTime? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_TimeProvider>()
        ?.currentTime;
  }

  static String? weekday(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_TimeProvider>()?.weekday;
  }

  @override
  State<CurrentTime> createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  DateTime? currentTime;
  late String day;

  @override
  void initState() {
    DateTimeServices.checkTime().then((dateTime) {
      setState(() {
        currentTime = dateTime;
        day = daysOfWeek[dateTime.weekday - 1];
      });
    });

    Timer(const Duration(seconds: 180), initState);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _TimeProvider(
      weekday: day,
      currentTime: currentTime,
      child: widget.child,
    );
  }
}

class _TimeProvider extends InheritedWidget {
  DateTime? currentTime;
  String? weekday;

  _TimeProvider(
      {this.currentTime, required this.weekday, required super.child});

  @override
  bool updateShouldNotify(covariant _TimeProvider oldWidget) {
    return currentTime != oldWidget.currentTime;
  }
}
