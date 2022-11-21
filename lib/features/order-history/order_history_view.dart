import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/components/order_histrory_tile.dart';
import 'package:tiffin_app/extensions.dart';
import 'package:tiffin_app/streams/order_history_stream.dart';
import 'package:tiffin_app/themes_and_styles/text_styles.dart';

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
            const CustomAppbar(title: 'Order History'),
            TextButton(
              // * show popup to filter history records.
              onPressed: () => showDialog(
                  context: context,
                  builder: (_) {
                    // return const PopupMenuButton();
                    return const Dialog();
                  }),
              child: const Text('This month'), // * open popUp to filter data.
            ),
            StreamBuilder(
              stream: orderHistoryStream,
              builder: (context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? const CupertinoActivityIndicator()
                    : (snapshot.data.docs.length == 0)
                        ? Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image.asset('lib/assets/no_order_recieved.png'),
                                Text(
                                  'You haven\'t placed any orders yet.',
                                  style: italicSmallTextStyle(),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: snapshot.data.docs.length,
                              separatorBuilder: ((context, index) =>
                                  const Divider()),
                              itemBuilder: (context, index) => OrderHistoryTile(
                                amount: snapshot.data.docs[index]['quantity'],
                                date: DateTime.parse(
                                        snapshot.data.docs[index]['date'])
                                    .dateFromTimestamp,
                                vendor: snapshot.data.docs[index]['vendor'],
                              ),
                            ),
                          );
              },
            ),
            // Divider(),
            // Text('Total: ')
          ],
        ),
      ),
    );
  }
}
