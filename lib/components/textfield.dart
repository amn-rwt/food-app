import 'package:flutter/material.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsecure;
  final String? prefixText;
  final TextInputType? textInputType;
  const CustomTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixText,
      this.textInputType = TextInputType.text,
      this.isObsecure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        obscureText: isObsecure,
        style: subTextStyle(),
        decoration: InputDecoration(
          prefixText: prefixText,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black45,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
