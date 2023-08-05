import 'package:flutter/material.dart';
import 'package:logistics_app/slash_screen.dart';

import 'intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Logistics App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: IntroductionScreenPage(),
    );
  }
}


