import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderSettingsController extends GetxController {
  final String? vendorId;

  OrderSettingsController({this.vendorId});

  List<String> repeatOrderDays = [];

  void addDayToRepeatOrderList(int day) {
    repeatOrderDays.contains(day)
        ? repeatOrderDays.remove(day)
        : repeatOrderDays.add(day.toString());
  }

  Stream vendorSettingStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('vendors')
      .doc('DzhfXo7ySwTgtbWSwjMfjEwgQNg1')
      .snapshots();

  ValueNotifier<bool> repeatOrder = ValueNotifier(true);
  ValueNotifier<bool> cancelForHolidays = ValueNotifier(true);

  Future<void> updateVendorSettings() async {
    log('here');
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('vendors')
        .doc('sZBn6ZllBWTMkRFq1MwXoBM9Iz42')
        .set({
      'days': repeatOrderDays,
      'repeatOrder': repeatOrder.value,
      'cancel_for_holidays': false,
    });
  }
}
