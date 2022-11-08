import 'package:flutter/material.dart';
import 'package:tiffin_app/components/custom_appbar.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Account Settings'),
    );
  }
}
