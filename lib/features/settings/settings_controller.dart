import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tiffin_app/constants/color_constants.dart';

import '../login/view/login_view.dart';

class SettingsController extends GetxController {
  void logout(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      confirmBtnText: 'Logout',
      titleColor: primaryColor,
      onConfirmBtnTap: () => FirebaseAuth.instance.signOut().then(
            (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginView(),
              ),
            ),
          ),
    );
  }
}
