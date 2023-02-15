import 'package:flutter/material.dart';
import 'package:herodb/constants.dart';
import 'package:herodb/pages/home.dart';
import 'package:herodb/pages/search.dart';
import 'package:herodb/pages/swipe.dart';
import 'package:herodb/pages/teste.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: TesteScreen(),
    );
  }
}
