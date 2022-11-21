import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/services/time_provider.dart';

class FirebaseServices {
  static void addUser(String username, String email) {
    DocumentReference users = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    users.set({
      'name': username,
      'email': email,
    });
  }

  static addVendor(String vendorReference) {
    DocumentReference addedVendors = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('vendors')
        .doc(vendorReference);

    addedVendors.set({
      'days': [],
      'repeatOrder': false,
      'cancel_for_holidays': false,
    });
  }

  static removeVendor(String vendorId) {
    log('in remove');
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('vendors')
        .doc(vendorId)
        .delete();
  }

  static addRemoveVendor(String vendorId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('vendors')
        .doc(vendorId)
        .get()
        .then((value) =>
            value.exists ? removeVendor(vendorId) : addVendor(vendorId));
  }

  static Future isVendorAdded(String vendorReference) async {
    bool? exists;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('vendors')
          .doc(vendorReference)
          .get()
          .then((doc) {
        exists = doc.exists;
      });
      return exists;
    } catch (e) {
      addVendor(vendorReference);
    }
  }

  static Future addOrder(
      int amt, String vendorName, BuildContext context) async {
    final doc = await FirebaseFirestore.instance
        .collection('orders')
        .where('date',
            isEqualTo: CurrentTime.of(context).toString().substring(0, 10))
        .get();

    log(vendorName + CurrentTime.of(context).toString().substring(0, 10));

    (doc.isBlank!) ? log('doc exists') : log('doc not present');
    FirebaseFirestore.instance
        .collection('orders')
        .doc(FirebaseAuth.instance.currentUser!.uid +
            CurrentTime.of(context).toString().substring(0, 10))
        .set({
      'date': CurrentTime.of(context).toString().substring(0, 10),
      'vendor': vendorName,
      'quantity': amt,
      'user': FirebaseAuth.instance.currentUser!.uid,
    }).then(
      (value) => Get.snackbar(
        'Order Placed',
        'Order has been placed for $amt from $vendorName',
        animationDuration: const Duration(milliseconds: 400),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  // static Future addOrder(
  //     int amt, String vendorName, BuildContext context) async {
  //   final docRef = await FirebaseFirestore.instance
  //       .collection('orders')
  //       .doc('users/Y6i9eZqtXUSH77HYy4gtDMvSVTQ2/orders/2022-11-17')
  //       .set({
  //     'userId': FirebaseAuth.instance.currentUser!.uid,
  //     'date': CurrentTime.of(context),
  //     'amount': amt,
  //     'vendor': vendorName,
  //   });
  // await FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .collection('orders')
  //     .add({'orderId': docRef});
}
