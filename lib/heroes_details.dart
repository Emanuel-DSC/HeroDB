import 'package:flutter/material.dart';

class HeroesDetailsScreen extends StatelessWidget {HeroesDetailsScreen({
  super.key, required this.hero});
  Map<String, dynamic> hero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hero['name']
      ),),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          child: Text(hero['biography']['publisher'] ?? 'NO INFORMATION ABOUT IT'),
        ),
      ),
    );
  }
}
