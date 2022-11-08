import 'package:flutter/material.dart';
import 'package:tiffin_app/constants/color_constants.dart';

ButtonStyle activeButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 24),
    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}

ButtonStyle disableButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.grey,
    padding: const EdgeInsets.symmetric(horizontal: 24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: primaryColor,
    ),
  );
}
