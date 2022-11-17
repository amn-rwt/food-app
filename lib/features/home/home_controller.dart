import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tiffin_app/constants/app_constants.dart';
import 'package:tiffin_app/services/time_provider.dart';

class HomeController extends GetxController {
  BuildContext context;
  HomeController({required this.context});

  bool? isAdded;

  @override
  void onReady() {
    getDateTimeData();
    super.onReady();
  }

  late String today;

  getDateTimeData() async {
    final DateTime day = CurrentTime.of(context)!;
    today = daysOfWeek[day.weekday - 1];
  }

  late Stream todaysMenuStream = FirebaseFirestore.instance
      .collection('vendors')
      .doc('sZBn6ZllBWTMkRFq1MwXoBM9Iz42') // * custom vendor id
      .collection('menu')
      .doc(today) // * custom day
      .snapshots();

  Stream vendor = FirebaseFirestore.instance
      .collection('vendors')
      .doc('sZBn6ZllBWTMkRFq1MwXoBM9Iz42')
      .snapshots();

  Stream orders = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('orders')
      .snapshots();

  Stream hasVendorsAdded = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('vendors')
      .snapshots();
}
