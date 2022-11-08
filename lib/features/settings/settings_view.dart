import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiffin_app/components/custom_appbar.dart';
import 'package:tiffin_app/components/custom_list_tile.dart';
import 'package:tiffin_app/constants/color_constants.dart';
import 'package:tiffin_app/features/about/about_view.dart';
import 'package:tiffin_app/features/account-settings/account_settings.dart';
import 'package:tiffin_app/features/login/view/login_view.dart';
import 'package:tiffin_app/features/order-history/order_history_view.dart';
import 'package:tiffin_app/features/vendors/vendors_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: const CustomAppbar(title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user!.photoURL!),
            ),
            Text(
              user.displayName!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              '(${user.email})',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  const CustomListTile(
                      label: 'Order History', navigateTo: OrderHistory()),
                  const CustomListTile(
                      label: 'Account Settings', navigateTo: AccountSettings()),
                  const CustomListTile(
                      label: 'Vendors', navigateTo: VendorsView()),
                  const CustomListTile(label: 'About', navigateTo: AboutView()),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: listTileColor,
                    ),
                    child: ListTile(
                      onTap: () {
                        FirebaseAuth.instance.signOut().then(
                              (value) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ),
                              ),
                            );
                      },
                      dense: true,
                      title: const Text('Logout'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
