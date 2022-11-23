import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/services/time_provider.dart';

class FirebaseServices {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  void addUser(String username, String email) {
    DocumentReference users =
        FirebaseFirestore.instance.collection('users').doc(uid);

    users.set({
      'name': username,
      'email': email,
    });
  }

  addRemoveVendor(String vendorId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('vendors')
        .doc(vendorId)
        .get()
        .then((value) =>
            value.exists ? removeVendor(vendorId) : addVendor(vendorId));
  }

  addVendor(String vendorReference) {
    DocumentReference addedVendors = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('vendors')
        .doc(vendorReference);

    addedVendors.set({
      'days': [],
      'repeat_order': false,
      'cancel_for_holidays': false,
      'show_reminder': false,
    });
  }

  removeVendor(String vendorId) {
    log('in remove');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('vendors')
        .doc(vendorId)
        .delete();
  }

  Future isVendorAdded(String vendorReference) async {
    bool? exists;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
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

  Future addOrder(int amt, String vendorName, BuildContext context) async {
    final doc = await FirebaseFirestore.instance
        .collection('orders')
        .where('user', isEqualTo: uid)
        .where('vendor', isEqualTo: vendorName)
        .where('date', isEqualTo: DateTime.now().toString().substring(0, 10))
        .get();

    if (doc.docs.isEmpty) {
      FirebaseFirestore.instance.collection('orders').add({
        'user': uid,
        'vendor': vendorName,
        'quantity': amt,
        'date': CurrentTime.of(context).toString().substring(0, 10),
      }).then((value) => Get.snackbar('Order Placed',
          'Order has been placed for $amt tiffins from $vendorName.'));
    } else {
      String id = doc.docs.first.id;
      FirebaseFirestore.instance
          .collection('orders')
          .doc(id)
          .set({'quantity': amt}, SetOptions(merge: true)).then((value) =>
              Get.snackbar('Order Placed',
                  'Order has been placed for $amt tiffins from $vendorName.'));
      ;
    }
  }
}
