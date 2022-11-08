import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/components/vendor_tile.dart';
import 'package:tiffin_app/features/vendors/vendors_controller.dart';

class VendorsView extends StatelessWidget {
  VendorsView({super.key});

  final controller = Get.put(VendorsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Vendors'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: FutureBuilder(
            future: controller.vendors.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                log('snapshot has error');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                log(snapshot.toString());
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return VendorTile(
                      isSubscribed: true,
                      name: snapshot.data!.docs[index]['name'],
                      phone: snapshot.data!.docs[index]['phone'],
                      price: snapshot.data!.docs[index]['pricePerTiffin']
                          .toString(),
                    );
                  },
                );
              }
              return Container();
            }),
      ),
    );
  }
}
