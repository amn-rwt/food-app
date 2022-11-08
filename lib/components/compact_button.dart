import 'package:flutter/material.dart';

class CompactButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;
  final String label;
  const CompactButton(
      {super.key,
      required this.label,
      required this.buttonStyle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(label),
      ),
    );
  }
}
