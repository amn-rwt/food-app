import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/features/home/home_view.dart';
import 'package:tiffin_app/features/login/controller/login_controller.dart';

import '../../../constants/color_constants.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    log(FirebaseAuth.instance.currentUser?.uid ?? 'here');
    ValueNotifier<bool> isLoading = ValueNotifier(false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
          child: Column(
            children: [
              // Image.asset('lib/assets/logo.png'),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ValueListenableBuilder(
                  valueListenable: isLoading,
                  builder: (context, value, child) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: primaryColor,
                    ),
                    onPressed: () {
                      controller.loginWithGoogle().then(
                            (value) => Get.offAll(const HomeView()),
                          );
                      isLoading.value = !isLoading.value;
                    },
                    child: (isLoading.value)
                        ? const CupertinoActivityIndicator(color: Colors.white)
                        : const Text('LOGIN WITH GOOGLE'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
