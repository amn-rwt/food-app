import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 40,
          maxWidth: 40,
        ),
        child: Container(
          // height: 40,
          // width: 40,
          padding: const EdgeInsets.only(left: 8),
          // margin: const EdgeInsets.fromLTRB(12, 4, 0, 4),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 1),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
