import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../features/settings/settings_view.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(user!.photoURL!),
          ),
          Container(
            height: 48,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
              ),
            ], borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsView(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
