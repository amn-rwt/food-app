import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../themes_and_styles/button_styles.dart';

class LargeButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final bool isLoading;
  const LargeButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed(),
        style: activeButtonStyle(),
        child: (isLoading)
            ? const CupertinoActivityIndicator(
                color: Colors.white,
              )
            : Text(label),
      ),
    );
  }
}
