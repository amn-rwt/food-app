import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/components/home_appbar.dart';
import 'package:tiffin_app/components/order_histrory_tile.dart';
import 'package:tiffin_app/components/todays_menu_tile.dart';
import 'package:tiffin_app/extensions.dart';
import 'package:tiffin_app/features/home/home_controller.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';

import '../order-history/order_history_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController(context: context));
    return SafeArea(
      bottom: false,
      child: Scaffold(
        // appBar: const HomeAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                TodaysMenu(
                  snapshot: HomeController.todaysMenuStream,
                  vendorName: controller.vendor,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order History',
                      style: headingTextStyle(),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderHistory(),
                        ),
                      ),
                      child: const Text(
                        'see all',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                StreamBuilder(
                  stream: controller.orders,
                  builder: (context, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? const CupertinoActivityIndicator()
                      : Flexible(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data.docs.length,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: ((context, index) {
                              snapshot.data.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                              });
                              // final orderData = snapshot.data;
                              DateTime dateTime = DateTime.parse(snapshot
                                  .data.docs[index]['date']
                                  .toDate()
                                  .toString());
                              return OrderHistoryTile(
                                amount: snapshot.data.docs[index]['amount'],
                                date: dateTime.dateFromTimestamp,
                                vendor: snapshot.data.docs[index]['vendor'],
                              );
                            }),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
