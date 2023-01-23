import 'package:flutter/material.dart';
import 'database.dart';

class HeroesDetailsScreen extends StatelessWidget {HeroesDetailsScreen({
  super.key, required this.hero});
  Map<String, dynamic> hero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hero['name']
      ),),
      body: Container(),
    );
  }
}
