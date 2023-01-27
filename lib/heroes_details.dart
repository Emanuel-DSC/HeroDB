
import 'package:flutter/material.dart';


class HeroesDetailsScreen extends StatelessWidget {
  HeroesDetailsScreen({super.key, required this.hero});
  Map<String, dynamic> hero;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    String publisherName = hero['biography']['publisher'].toString();
    return Scaffold(
      backgroundColor: Colors.grey[800],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body:  Column(
          children: [
            Container(
              height: height * 0.4,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(hero['images']['md']), fit: BoxFit.fill,),
              ),
            ),
            Container(
              height: 20,
              width: width,
              decoration: BoxDecoration(
               gradient: LinearGradient(
                begin: Alignment.topLeft, 
                end: Alignment.centerRight, 
                colors: [publisherName == 'Marvel Comics' ? Colors.blue : Colors.black, Colors.red]),
              ),
            )
          ],
        ),
    );
  }
}
