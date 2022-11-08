// import 'package:flutter/material.dart';
// import 'package:tiffin_app/themes_and_styles/button_styles.dart';
// import 'package:tiffin_app/constants/color_constants.dart';
// import 'package:tiffin_app/themes_and_styles/text_styles.dart';

// class TodaysMenu extends StatelessWidget {
//   final String vendorsName;
//   final int items;

//   const TodaysMenu({super.key, required this.items, required this.vendorsName});

//   @override
//   Widget build(BuildContext context) {
//     int count = 1;
//     return Flexible(
//       child: Container(
//         // height: 200,
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: listTileColor,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               vendorsName,
//               style: headingStyle(),
//             ), // * replace with vendor name
//             const Text(
//               'Today\'s Menu',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: GridView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   mainAxisSpacing: 8,
//                   crossAxisSpacing: 4,
//                   crossAxisCount: 4,
//                 ),
//                 itemCount: items,
//                 itemBuilder: (context, index) => Column(
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.amber,
//                       ),
//                     ),
//                     const Text('data')
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         onPressed: () => count--,
//                         icon: const Icon(
//                           Icons.remove,
//                           color: Colors.black54,
//                           size: 16,
//                         ),
//                       ),
//                       Text(count.toString()),
//                       IconButton(
//                         onPressed: () => count++,
//                         icon: const Icon(
//                           Icons.add,
//                           color: Colors.black54,
//                           size: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   style: activeButtonStyle(),
//                   onPressed: () {},
//                   child: const Text('Order'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          Align(
            alignment: Alignment.centerRight,
            child: CompactButton(
              label: 'Order',
              onPressed: () {},
              buttonStyle: ElevatedButton.styleFrom(),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
