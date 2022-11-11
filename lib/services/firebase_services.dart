import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      return false;
    }
    ;
  }
}
