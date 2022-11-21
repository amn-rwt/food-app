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
                  stream: controller.vendors,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CupertinoActivityIndicator();
                    }
                    final docs = snapshot.data!.docs;
                    if (docs.isEmpty) {
                      return const NoVenodrsAddedTile();
                    }
                    // print(docs.first.id);
                    // return Text('Some text');
                    else if (docs.length == 1) {
                      log('here');
                      return TodaysMenu(
                          vendorName: controller.vendor(docs.first.id),
                          snapshot: controller.todaysMenuStream(docs.first.id));
                    } else if (docs.length > 1) {
                      log('multi vendors');
                      for (int i = 0; i < docs.length; i++) {
                        (controller.listOfVendors.contains(docs[i].id))
                            ? controller.listOfVendors.remove(docs[i].id)
                            : controller.listOfVendors.add('${docs[i].id}');
                      }
                      // return const Text('more than one vendor added');
                      return SizedBox(
                        height: 300,
                        child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) => TodaysMenu(
                                  vendorName: controller
                                      .vendor(controller.listOfVendors[index]),
                                  snapshot: controller.todaysMenuStream(
                                      controller.listOfVendors[index]),
                                )),
                      );
                    }
                    return const Text('Something went wrong');
                  },
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
                  builder: (context, snapshot) => (snapshot.connectionState ==
                          ConnectionState.waiting)
                      ? const CupertinoActivityIndicator()
                      : (snapshot.data!.docs.length == 0)
                          ? Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image.asset('lib/assets/no_order_recieved.png'),
                                Text(
                                  'You haven\'t placed any orders yet.',
                                  style: italicSmallTextStyle(),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )
                          : Flexible(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemBuilder: ((context, index) {
                                  DateTime dateTime = DateTime.parse(
                                      snapshot.data!.docs[index]['date']);

                                  return OrderHistoryTile(
                                    amount: snapshot.data!.docs[index]
                                        ['quantity'],
                                    date: dateTime.dateFromTimestamp,
                                    vendor: snapshot.data!.docs[index]
                                        ['vendor'],
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
