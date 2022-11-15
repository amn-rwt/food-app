import 'package:tiffin_app/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/constants/color_constants.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    getDate();
    super.initState();
  }

  DateTime? today;
  getDate() async {
    // today = await DateTimeServices.checkTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: 'Test'),
        backgroundColor: scaffoldBackgroundColor,
        body: Text(daysOfWeek[today!.weekday - 1]));
  }
}
