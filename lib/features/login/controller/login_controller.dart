import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiffin_app/services/firebase_services.dart';

class LoginController extends GetxController {
  final FirebaseServices firebaseServices = FirebaseServices();

  Future loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final CollectionReference users = firebaseFirestore.collection('users');

    return await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) => value.additionalUserInfo!.isNewUser
              ? FirebaseServices.addUser(
                  googleUser!.displayName!, googleUser.email)
              : log('already a user'),
        );
  }
}
