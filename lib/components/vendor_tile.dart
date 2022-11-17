import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';
import 'package:tiffin_app/features/order-settings/order_settings_view.dart';
import 'package:tiffin_app/themes_and_styles/button_styles.dart';

class VendorTile extends StatelessWidget {
  final QueryDocumentSnapshot vendorSnapshot;
  final Future isSubscribed;
  final VoidCallback onPressed;
  const VendorTile({
    super.key,
    required this.vendorSnapshot,
    required this.isSubscribed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OrderSettings(vendorId: vendorSnapshot.id))),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vendorSnapshot['name'],
              style: headingTextStyle(),
            ),
            Text(
              vendorSnapshot['phone'],
              style: subTextStyle(),
            ),
            Text(
              'Price: ${vendorSnapshot['pricePerTiffin']}',
              style: const TextStyle(fontSize: 12),
            ), //${pricePerTiffin}
            Align(
              alignment: Alignment.centerRight,
              child: FutureBuilder(
                future: isSubscribed,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CupertinoActivityIndicator();
                  }
                  var isAdded = snapshot.data;
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return ElevatedButton(
                        onPressed: () {
                          onPressed();
                          setState(() {
                            isAdded = !isAdded;
                          });
                        },
                        style: isAdded
                            ? activeButtonStyle()
                            : disableButtonStyle(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            isAdded
                                ? const Icon(Icons.done_outline, size: 16)
                                : const Icon(Icons.add_outlined, size: 16),
                            const SizedBox(width: 8),
                            isAdded ? const Text('Added') : const Text('Add')
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
