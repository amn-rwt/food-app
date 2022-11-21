import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/components/large_button.dart';
import 'package:tiffin_app/components/textfield.dart';
import 'package:tiffin_app/features/account-settings/account_settings_controller.dart';

class AccountSettingsView extends StatelessWidget {
  AccountSettingsView({super.key});

  final controller = Get.put(AccountSettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Profile Update'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  FirebaseAuth.instance.currentUser!.photoURL ?? ''),
            ),
            const SizedBox(height: 20),
            CustomTextfield(
              controller: controller.fullName,
              hintText: 'Full name',
            ),
            CustomTextfield(
              controller: controller.phone,
              hintText: 'Phone',
            ),
            const Spacer(),
            LargeButton(
              label: 'SAVE',
              onPressed: () => controller.updateProfile(),
            ),
          ],
        ),
      ),
    );
  }
}
