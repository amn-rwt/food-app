import 'package:flutter/material.dart';
import 'package:tiffin_app/features/vendors/vendors_view.dart';
import 'package:tiffin_app/themes_and_styles/button_styles.dart';

class NoVenodrsAddedTile extends StatelessWidget {
  const NoVenodrsAddedTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'You haven\'t added any vendor yet.',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: activeButtonStyle(),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => VendorsView())),
            child: const Text('Go to vendors'),
          ),
        ],
      ),
    );
  }
}
