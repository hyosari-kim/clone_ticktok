import 'package:flutter/material.dart';

void main() {
  runApp(const TickTockApp());
}

class TickTockApp extends StatelessWidget {
  const TickTockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFFE9435A),
      ),
      home: Container(),
    );
  }
}
