import 'package:flutter/material.dart';
import 'package:tiffin_app/constants/color_constants.dart';
import 'package:tiffin_app/themes_and_styles/button_styles.dart';
import 'compact_button.dart';

class TodaysMenu extends StatelessWidget {
  const TodaysMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('vendor'),
          Text(
            'Today\'s Menu',
            // style: mediumHeadingTextStyle(),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                // itemCount: snapshot.data,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                ),
                // itemCount: snapshot.data.length,

                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'item$index',
                        // style: mediumTextStyle(),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  );
                }),
          ),
          const SizedBox(height: 30),
          Container(
              // child: Label,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,
                // width: 100,
                decoration: BoxDecoration(
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove, color: primaryColor, size: 16),
                    ),
                    Text('1'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: primaryColor, size: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              CompactButton(
                label: 'Order',
                onPressed: () {},
                buttonStyle: activeButtonStyle(),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
