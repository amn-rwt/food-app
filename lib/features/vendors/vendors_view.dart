import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/components/vendor_tile.dart';
import 'package:tiffin_app/features/vendors/vendors_controller.dart';
import 'package:tiffin_app/services/firebase_services.dart';

class VendorsView extends StatelessWidget {
  VendorsView({super.key});

  final controller = Get.put(VendorsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Vendors'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: StreamBuilder(
          stream: controller.vendors,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              log('snapshot has error');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CupertinoActivityIndicator());
            }
            return ListView.separated(
              addAutomaticKeepAlives: true,
              itemCount: snapshot.data!.docs.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                Future isAdded = FirebaseServices.isVendorAdded(
                    snapshot.data!.docs[index].id);
                return VendorTile(
                  vendorSnapshot: snapshot.data!.docs[index],
                  onPressed: () => FirebaseServices.addRemoveVendor(
                      snapshot.data!.docs[index].id),
                  // if added remove else add
                  isSubscribed: isAdded,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
