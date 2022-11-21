import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettingsController extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();

  RxBool isLoading = false.obs;

  void updateProfile() {
    log('here');
  }
}
