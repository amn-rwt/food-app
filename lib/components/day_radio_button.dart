import 'package:flutter/material.dart';
import 'package:tiffin_app/constants/color_constants.dart';

class DayRadioButton extends StatefulWidget {
  final String day;
  final bool isActive;
  const DayRadioButton({super.key, required this.day, required this.isActive});

  @override
  State<DayRadioButton> createState() => _DayRadioButtonState();
}

class _DayRadioButtonState extends State<DayRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: (!widget.isActive) ? Border.all(width: 0.5) : null,
        color: (widget.isActive) ? primaryColor : Colors.white,
        shape: BoxShape.circle,
      ),
      child: Text(
        widget.day,
        style: TextStyle(
          color: (widget.isActive) ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
