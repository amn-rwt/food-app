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

  late String today;

  late Stream todaysMenuStream = FirebaseFirestore.instance
      .collection('vendors')
      .doc('DzhfXo7ySwTgtbWSwjMfjEwgQNg1') // * custom vendor id
      .collection('menu')
      .doc(CurrentTime.weekday(context)) // * custom day
      .snapshots();

  Stream vendor = FirebaseFirestore.instance
      .collection('vendors')
      .doc('DzhfXo7ySwTgtbWSwjMfjEwgQNg1')
      .snapshots();

  // Stream orders = FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .collection('orders')
  //     .snapshots();

  Stream hasVendorsAdded = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('vendors')
      .snapshots();

  Stream orders = FirebaseFirestore.instance
      .collection('orders')
      .where('user', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
}
