import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tiffin_app/constants/color_constants.dart';

class CustomListTile extends StatelessWidget {
  final String label;
  final Widget navigateTo;
  final bool isTrailing;
  const CustomListTile({
    super.key,
    required this.label,
    required this.navigateTo,
    this.isTrailing = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: listTileColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateTo),
        ),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(label),
        trailing: (isTrailing)
            ? const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              )
            : const SizedBox(),
      ),
    );
  }
}
