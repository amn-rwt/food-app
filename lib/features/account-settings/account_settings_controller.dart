import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettingsController extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();

  RxBool isLoading = false.obs;

  void updateProfile() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'name': fullName.value.text,
      'phone': phone.value.text,
    }, SetOptions(merge: true));
  }
}
