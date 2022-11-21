import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:tiffin_app/services/time_provider.dart';

class HomeController extends GetxController {
  BuildContext context;
  HomeController({required this.context});

  bool? isAdded;

  late String today;

  List listOfVendors = [];

  Stream<DocumentSnapshot<Map<String, dynamic>>> todaysMenuStream(
          String vendorId) =>
      FirebaseFirestore.instance
          .collection('vendors')
          .doc(vendorId) // * custom vendor id
          .collection('menu')
          .doc(CurrentTime.weekday(context))
          .snapshots();

  Stream<DocumentSnapshot<Map<String, dynamic>>> vendor(String vendorId) =>
      FirebaseFirestore.instance
          .collection('vendors')
          .doc(vendorId) // * custom vendor Id
          .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> vendors = FirebaseFirestore
      .instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('vendors')
      .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> orders = FirebaseFirestore
      .instance
      .collection('orders')
      .where('user', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
}
