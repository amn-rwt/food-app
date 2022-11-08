import 'package:flutter/material.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/components/vendor_tile.dart';

class VendorsView extends StatelessWidget {
  const VendorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Vendors'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: ListView.separated(
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return (index % 2 == 0)
                ? const VendorTile(isSubscribed: true)
                : const VendorTile(isSubscribed: false);
          },
        ),
      ),
    );
  }
}
