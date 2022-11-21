import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tiffin_app/constants/color_constants.dart';

import '../login/view/login_view.dart';

class SettingsController extends GetxController {
  void logout(BuildContext context) {
    FirebaseAuth.instance.signOut().then((value) => Get.offAll(LoginView()));
  }
}
