import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void addUser(String username, String email) {
    users.add({
      'name': username,
      'email': email,
    });
  }
}
