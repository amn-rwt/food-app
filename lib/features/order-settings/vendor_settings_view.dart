import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tiffin_app/components/custom_appbar.dart';

class VendorSettingView extends StatelessWidget {
  const VendorSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'Vendor Settings'),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Repeat Orders'),
                    Checkbox(value: true, onChanged: (value) {}),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      log('here');
                      return Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Text('data')
        ],
      ),
    );
  }
}
