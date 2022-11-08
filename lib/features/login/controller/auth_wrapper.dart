import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiffin_app/features/home/home_view.dart';
import 'package:tiffin_app/features/login/view/login_view.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        isLoggedIn = false;
      } else {
        isLoggedIn = true;
      }
    });
    return (isLoggedIn) ? LoginView() : const HomeView();
  }
}
