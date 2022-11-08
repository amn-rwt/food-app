import 'package:flutter/material.dart';
import 'package:tiffin_app/constants/color_constants.dart';
import 'package:tiffin_app/features/vendors/vendors_view.dart';

class NoVenodrsAddedTile extends StatelessWidget {
  const NoVenodrsAddedTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: listTileColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('You haven\'t subscribed to any vendor yet.'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 24),
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => VendorsView())),
            child: const Text('Go to vendors'),
          ),
        ],
      ),
    );
  }
}
