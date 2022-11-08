import 'package:flutter/material.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/components/vendor_tile.dart';
import 'package:tiffin_app/constants/color_constants.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Vendors'),
      backgroundColor: scaffoldBackgroundColor,
      body: const VendorTile(
        isSubscribed: true,
      ),
    );
  }
}
