import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiffin_app/constants/color_constants.dart';
import 'package:tiffin_app/services/firebase_services.dart';
import 'package:tiffin_app/themes_and_styles/button_styles.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';
import 'compact_button.dart';

class TodaysMenu extends StatelessWidget {
  final Stream snapshot;
  final Stream vendorName;
  TodaysMenu({super.key, required this.vendorName, required this.snapshot});
  final firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    ValueNotifier orderCount = ValueNotifier(1);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: StreamBuilder(
          stream: vendorName,
          builder: (context, vendorName) {
            return (vendorName.connectionState == ConnectionState.waiting)
                ? const CupertinoActivityIndicator()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(vendorName.data['resturantName'],
                          style: headingStyle()),
                      const Text(
                        'Today\'s Menu',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),
                      Flexible(
                        child: StreamBuilder(
                          stream: snapshot,
                          builder: (context, snapshot) {
                            return (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                ? const CupertinoActivityIndicator()
                                : (!snapshot.data.exists)
                                    ? const Text(
                                        'The menu for the day hasn\'t been set yet.')
                                    : GridView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            snapshot.data['items'].length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        // itemCount: snapshot.data,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 10,
                                        ),
                                        // itemCount: snapshot.data.length,

                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Tooltip(
                                                message: snapshot.data['items']
                                                    [index],
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data['items'][index],
                                                // style: mediumTextStyle(),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          );
                                        },
                                      );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 40,
                            // width: 100,
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              boxShadow: const [
                                BoxShadow(color: Colors.black12),
                              ],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => (orderCount.value > 1)
                                      ? orderCount.value--
                                      : null,
                                  icon: Icon(Icons.remove,
                                      color: primaryColor, size: 16),
                                ),
                                ValueListenableBuilder(
                                    valueListenable: orderCount,
                                    builder: (context, value, child) =>
                                        Text(value.toString())),
                                // const Text('1'),
                                IconButton(
                                  onPressed: () => orderCount.value++,
                                  icon: Icon(Icons.add,
                                      color: primaryColor, size: 16),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          CompactButton(
                            label: 'Order',
                            onPressed: () => firebaseServices.addOrder(
                                orderCount.value,
                                vendorName.data['resturantName'],
                                context),
                            buttonStyle: activeButtonStyle(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  );
          }),
    );
  }
}
