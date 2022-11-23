import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiffin_app/features/home/home_view.dart';
import 'package:tiffin_app/features/login/view/login_view.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    log('uid: ${FirebaseAuth.instance.currentUser?.uid ?? 'here'}');
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (contex, snapshot) {
        return (snapshot.hasData) ? const HomeView() : LoginView();
      },
    );
  }
}
