import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/main_screen.dart';

void main() {
  runApp(const TickTokApp());
}

class TickTokApp extends StatelessWidget {
  const TickTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black54,
            size: Sizes.size20,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
