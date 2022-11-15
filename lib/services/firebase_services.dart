import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      'name': '',
      'days': ['Day1', 'Day2']
    });
  }

  static Future<bool?> isVendorAdded(String vendorReference) async {
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
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('orders')
        .doc(CurrentTime.of(context).toString().substring(0, 10))
        .set({
      'date': CurrentTime.of(context),
      'amount': amt,
      'vendor': vendorName
    });
  }
}
