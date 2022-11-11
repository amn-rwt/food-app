import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tiffin_app/components/custom_appbar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppbar(title: 'About'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          children: [
            const CustomAppbar(title: 'About'),
          ],
        ),
      ),
    );
  }
}
