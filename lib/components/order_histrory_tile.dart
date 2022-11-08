import 'package:flutter/material.dart';

class OrderHistoryTile extends StatelessWidget {
  final String date;
  final int amount;
  final String vendor;
  const OrderHistoryTile(
      {super.key,
      required this.vendor,
      required this.amount,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(vendor),
            Text(date),
          ],
        ),
        Text(amount.toString()),
      ],
    );
  }
}
