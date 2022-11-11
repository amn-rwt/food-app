import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';
import 'package:tiffin_app/features/order-settings/order_settings_view.dart';
import 'package:tiffin_app/themes_and_styles/button_styles.dart';

class VendorTile extends StatelessWidget {
  final Future isSubscribed;
  final String name;
  final String phone;
  final String price;
  final VoidCallback onPressed;
  const VendorTile(
      {super.key,
      required this.isSubscribed,
      required this.name,
      required this.onPressed,
      required this.phone,
      required this.price});

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
              name,
              style: headingTextStyle(),
            ),
            Text(
              phone,
              style: subTextStyle(),
            ),
            Text(
              'Price: $price',
              style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ), //${pricePerTiffin}
            Align(
                alignment: Alignment.centerRight,
                child: FutureBuilder(
                  future: isSubscribed,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CupertinoActivityIndicator();
                    }
                    return ElevatedButton(
                      onPressed: onPressed,
                      style: (snapshot.data == true)
                          ? activeButtonStyle()
                          : disableButtonStyle(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          snapshot.data == true
                              ? const Icon(Icons.done_outline)
                              : const SizedBox.shrink(),
                          const SizedBox(width: 5),
                          snapshot.data == true
                              ? const Text('Added')
                              : const Text('Add')
                        ],
                      ),
                    );
                  },
                )
                // ElevatedButton(
                //   onPressed: () => onPressed,
                //   style: (isSubscribed == true)
                //       ? activeButtonStyle()
                //       : disableButtonStyle(),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       FutureBuilder(
                //           future: isSubscribed,
                //           builder: (context, snapshot) {
                //             if (snapshot.connectionState ==
                //                 ConnectionState.waiting) {
                //               return CupertinoActivityIndicator();
                //             }
                //             return (snapshot.data! == true)
                //                 ? Text('added')
                //                 : Text('not');
                //           }),
                //       // ValueListenableBuilder(
                //       //     valueListenable: isSubscribed,
                //       //     builder: ((context, value, child) =>
                //       //         (isSubscribed.value)
                //       //             ? const Icon(
                //       //                 Icons.done_outline,
                //       //                 size: 16,
                //       //               )
                //       //             : const SizedBox.shrink())),
                //       const SizedBox(width: 8),
                //       // Text(
                //       //   (isSubscribed.value ? 'Added' : 'Add'),
                //       // ),
                //     ],
                //   ),
                // ),
                )
          ],
        ),
      ),
    );
  }
}
