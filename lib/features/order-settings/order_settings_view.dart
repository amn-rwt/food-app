import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/components/day_radio_button.dart';
import 'package:tiffin_app/constants/app_constants.dart';
import 'package:tiffin_app/constants/color_constants.dart';
import 'package:tiffin_app/features/order-settings/order_settings_controller.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';

class OrderSettings extends StatelessWidget {
  final String vendorId;
  const OrderSettings({super.key, required this.vendorId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderSettingsController(vendorId: vendorId));
    return Scaffold(
      appBar: const CustomAppbar(title: 'Order Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: StreamBuilder(
            stream: controller.vendorSettingStream(vendorId),
            builder: (context, snapshot) {
              final snapData = snapshot.data['days'];
              return Column(
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
                          ValueListenableBuilder(
                            valueListenable: controller.repeatOrder,
                            builder: (context, value, child) => Checkbox(
                              activeColor: primaryColor,
                              value: snapshot.data['repeatOrder'],
                              onChanged: (_) {
                                controller.repeatOrder.value =
                                    !controller.repeatOrder.value;
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => DayRadioButton(
                            day: index + 1,
                            isActive: snapData.contains(daysOfWeek[index]),
                          ),
                          itemCount: daysOfWeek.length,
                        ),
                      ),
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
                          Checkbox(
                            value: false,
                            onChanged: ((value) {}),
                          ),
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
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                      ),
                      onPressed: () => controller.updateVendorSettings(vendorId),
                      child: const Text('SAVE'),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
