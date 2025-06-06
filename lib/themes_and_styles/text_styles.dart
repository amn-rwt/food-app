import 'package:flutter/material.dart';

TextStyle headingStyle() {
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}

TextStyle headingTextStyle() {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

TextStyle subTextStyle() {
  return const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w100,
  );
}

TextStyle italicSmallTextStyle({Color color = Colors.black54}) {
  return TextStyle(
    color: color,
    fontSize: 12,
    fontStyle: FontStyle.italic,
  );
}
