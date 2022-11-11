import 'package:flutter/material.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/components/order_histrory_tile.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomAppbar(title: 'Order History'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAppbar(title: 'Order History'),
            TextButton(
              onPressed: () {},
              child: const Text('This month'), // * open popUp to filter data.
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 15,
                separatorBuilder: ((context, index) => const Divider()),
                itemBuilder: (context, indext) => const OrderHistoryTile(
                  amount: 1,
                  date: 'Monday, 23 Nov',
                  vendor: 'Vendor 1',
                ), // * replace with firebase data
              ),
            ),
            Divider(),
            Text('Total: ')
          ],
        ),
      ),
    );
  }
}
