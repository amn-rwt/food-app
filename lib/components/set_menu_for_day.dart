import 'package:flutter/material.dart';

class SetMenuForDay extends StatelessWidget {
  const SetMenuForDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 200),
        expansionCallback: (index, isExpanded) {},
        children: [
          ExpansionPanel(
              headerBuilder: (context, isExpanded) => Text('Here'),
              body: ListTile(
                title: Text('here'),
              ))
        ],
      ),
    );
  }
}
