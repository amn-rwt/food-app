import 'package:flutter/material.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';

class VendorSettingsTile extends StatelessWidget {
  final String label;
  final Widget trailing;
  final Widget description;
  const VendorSettingsTile({
    super.key,
    this.description = const SizedBox(),
    required this.label,
    this.trailing = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: headingStyle()),
            trailing,
          ],
        ),
        description,
        const Divider()
      ],
    );
  }
}
