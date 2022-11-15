import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tiffin_app/constants/app_constants.dart';
import 'package:tiffin_app/services/date_time_services.dart';

import '../../services/time_provider.dart';

class HomeController extends GetxController {
  BuildContext context;
  HomeController({required this.context});

  @override
  void onReady() {
    getDateTimeData();
    super.onReady();
  }

  static String? today;
  getDateTimeData() async {
    final DateTime day = await DateTimeServices.checkTime();
    today = daysOfWeek[day.weekday - 1];
    log(today!);
  }

  Stream vendor = FirebaseFirestore.instance
      .collection('vendors')
      .doc('NEByZCZXE1hEWa8xSvuCMrMKUnR2')
      .snapshots();

  static Stream todaysMenuStream = FirebaseFirestore.instance
      .collection('vendors')
      .doc('NEByZCZXE1hEWa8xSvuCMrMKUnR2') // * custom vendor id
      .collection('menu')
      .doc(CurrentTime.weekday(context)) // * custom day
      .snapshots();

  Stream orders = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('orders')
      .snapshots();
}
