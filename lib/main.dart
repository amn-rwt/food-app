import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiffin_app/constants/color_constants.dart';
import 'package:tiffin_app/features/home/home_view.dart';
import 'package:tiffin_app/features/login/view/login_view.dart';
import 'features/login/controller/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Colors.black87,
          ),
          elevation: 0,
          backgroundColor: scaffoldBackgroundColor,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
    );
  }
}
