import 'package:flutter/material.dart';
import 'package:tiffin_app/components/home_appbar.dart';
import 'package:tiffin_app/components/order_histrory_tile.dart';
import 'package:tiffin_app/components/todays_menu_tile.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';

import '../order-history/order_history_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TodaysMenu(),
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
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: ((context, index) => const OrderHistoryTile(
                          amount: 1,
                          date: 'Monday, 12 Nov',
                          vendor: 'vendor 1',
                        )),
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
