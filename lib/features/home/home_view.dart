import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_app/components/home_appbar.dart';
import 'package:tiffin_app/components/no_vendors_tile.dart';
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                StreamBuilder(
                    stream: controller.hasVendorsAdded,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CupertinoActivityIndicator());
                      } else {
                        log('vendors : ${snapshot.data.size.toString()}');
                        // return snapshot.data.size != 0
                        // * size == 1 ? TodaysMenu() : PageView(children: multipleTodaysMenus)
                        // ? TodaysMenu(
                        //     snapshot: controller.todaysMenuStream,
                        //     vendorName: controller.vendor,
                        //   )
                        // : const NoVenodrsAddedTile();

                        return (snapshot.data.size > 1)
                            ? SizedBox(
                                height: 300,
                                child: PageView.builder(
                                    // physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.size,
                                    itemBuilder: (context, index) => TodaysMenu(
                                          vendorName: controller.vendor,
                                          snapshot: controller.todaysMenuStream,
                                        )),
                              )
                            : TodaysMenu(
                                vendorName: controller.vendor,
                                snapshot: controller.todaysMenuStream,
                              );
                      }
                    }),
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
                  builder: (context, snapshot) =>
                      (snapshot.connectionState == ConnectionState.waiting)
                          ? const CupertinoActivityIndicator()
                          : Flexible(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data.docs.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemBuilder: ((context, index) {
                                  DateTime dateTime = DateTime.parse(snapshot
                                      .data.docs[index]['date']
                                      .toDate()
                                      .toString());
                                  return OrderHistoryTile(
                                    amount: snapshot.data.docs[index]['quantity'],
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
