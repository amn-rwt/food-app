import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/components/day_radio_button.dart';
import 'package:tiffin_app/constants/app_constants.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';

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
                    Text(
                      'Repeat Orders',
                      style: headingTextStyle(),
                    ),
                    Checkbox(value: true, onChanged: (value) {}),
                  ],
                ),
                Flexible(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      log('here');
                      return DayRadioButton(day: index, isActive: false);
                    },
                  ),
                ),
                Text('data')
              ],
            ),
          ),
          Column(
            children: [Text('here')],
          )
        ],
      ),
    );
  }
}
