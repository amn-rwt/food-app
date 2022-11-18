import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Stream orderHistoryStream = FirebaseFirestore.instance
    .collection('orders')
    .where('user', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
    .snapshots();
