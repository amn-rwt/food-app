import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/constants/app_constants.dart';

class OrderSettingsController extends GetxController {
  final String? vendorId;

  OrderSettingsController({this.vendorId});

  RxBool repeatOrder = false.obs;
  RxBool cancelForHolidays = false.obs;
  RxBool showReminder = false.obs;

  List<String> repeatOrderDays = [];

  void addDayToRepeatOrderList(int day) {
    repeatOrderDays.contains(daysOfWeek[day])
        ? repeatOrderDays.remove(daysOfWeek[day])
        : repeatOrderDays.add(daysOfWeek[day]);
  }

  Stream vendorSettingStream(String vendorId) => FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('vendors')
      .doc(vendorId)
      .snapshots();

  Future<void> updateVendorSettings(String vendorId) async {
    log('here');
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('vendors')
        .doc(vendorId)
        .set({
      'days': repeatOrderDays,
      'repeat_order': repeatOrder.value,
      'cancel_for_holidays': cancelForHolidays.value,
      'show_reminder': showReminder.value,
    }, SetOptions(merge: true));
  }
}
