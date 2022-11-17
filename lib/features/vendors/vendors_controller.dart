import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class VendorsController extends GetxController {
  Stream vendors = FirebaseFirestore.instance.collection('vendors').snapshots();
}
