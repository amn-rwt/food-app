import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/constants/color_constants.dart';
import 'package:tiffin_app/features/home/home_view.dart';
import 'package:tiffin_app/features/login/controller/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: primaryColor,
                ),
                onPressed: () {
                  controller.loginWithGoogle().then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ),
                        ),
                      );
                },
                child: const Text('LOGIN WITH GOOGLE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
