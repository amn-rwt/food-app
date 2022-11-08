import 'package:flutter/material.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/components/day_radio_button.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';

class OrderSettings extends StatefulWidget {
  const OrderSettings({super.key});

  @override
  State<OrderSettings> createState() => _OrderSettingsState();
}

class _OrderSettingsState extends State<OrderSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Order Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Repeat Order', style: headingTextStyle()),
                    Checkbox(
                      value: false,
                      onChanged: (value) {
                        setState(() {
                          value = !value!;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: const [
                    DayRadioButton(day: 'M', isActive: true),
                    DayRadioButton(day: 'T', isActive: true),
                    DayRadioButton(day: 'W', isActive: true),
                    DayRadioButton(day: 'T', isActive: true),
                    DayRadioButton(day: 'F', isActive: true),
                    DayRadioButton(day: 'S', isActive: false),
                    DayRadioButton(day: 'S', isActive: false),
                  ],
                )
              ],
            ),
            const Divider(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cancel order for holidays',
                      style: headingTextStyle(),
                    ),
                    Checkbox(value: false, onChanged: (value) => !value!)
                  ],
                )
              ],
            ),
            const Divider(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reminder',
                      style: headingTextStyle(),
                    ),
                    Checkbox(value: false, onChanged: ((value) => !value!)),
                  ],
                ),
              ],
            ),
            const Divider(),
            Column(
              children: [
                Text(
                  'Pay Bills',
                  style: headingTextStyle(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
