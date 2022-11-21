import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/constants/color_constants.dart';
import 'package:tiffin_app/features/order-settings/order_settings_controller.dart';

class DayRadioButton extends StatefulWidget {
  final int day;
  bool isActive;
  DayRadioButton({super.key, required this.day, required this.isActive});

  @override
  State<DayRadioButton> createState() => _DayRadioButtonState();
}

class _DayRadioButtonState extends State<DayRadioButton> {
  final controller = Get.put(OrderSettingsController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          controller.addDayToRepeatOrderList(widget.day);
          widget.isActive = !widget.isActive;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: (!widget.isActive) ? Border.all(width: 0.5) : null,
          color: (widget.isActive) ? primaryColor : Colors.white,
          shape: BoxShape.circle,
        ),
        child: Text(
          widget.day.toString(),
          style: TextStyle(
            color: (widget.isActive) ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
