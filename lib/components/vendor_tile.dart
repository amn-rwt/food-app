import 'package:flutter/material.dart';
import 'package:tiffin_app/constants/color_constants.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';
import 'package:tiffin_app/features/order-settings/order_settings_view.dart';
import 'package:tiffin_app/themes_and_styles/button_styles.dart';

class VendorTile extends StatelessWidget {
  final bool isSubscribed;
  const VendorTile({super.key, required this.isSubscribed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const OrderSettings())),
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
              'Vendors name',
              style: headingTextStyle(),
            ),
            Text(
              'Vendors Phone',
              style: subTextStyle(),
            ),
            const Text(
              'Price per tiffin: ',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ), //${pricePerTiffin}
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // * subscribeToVendor();
                },
                style: (isSubscribed == true)
                    ? activeButtonStyle()
                    : disableButtonStyle(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (isSubscribed)
                        ? const Icon(
                            Icons.done_outline,
                            size: 16,
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(width: 8),
                    Text(
                      (isSubscribed ? 'Added' : 'Add'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
