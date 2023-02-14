import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodb/pages/swipe.dart';

import '../constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
          height: double.infinity,
          color: bgColor,
          ),
          Image.asset(homeCoverImg, 
          width: double.infinity,
          height: height * 0.5,
          fit: BoxFit.cover
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    bgColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.3 , 0.5],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.55,
            width: width,
            child: Column(
              children: [
                Text(
                  'data',
                  style: GoogleFonts.getFont('Inter',
                      color: whiteColor,
                      fontSize: 42,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'data',
                  style: GoogleFonts.getFont('Inter',
                      color: whiteColor,
                      fontSize: 22
                      ),
                ),
                Text(
                  'data',
                  style: GoogleFonts.getFont('Inter',
                      color: whiteColor,
                      fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
