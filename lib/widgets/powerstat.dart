import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodb/constants.dart';

class PowerList extends StatelessWidget {
  const PowerList({
    Key? key,
    required this.height,
    required this.textInfo,
    required this.valueInfo,
    required this.statsHeight,
    required this.iconName,
  }) : super(key: key);

  final String iconName;
  final String textInfo;
  final String valueInfo;
  final double height;
  final double statsHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * statsHeight,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 12),
        child: Container(
          height: 45,
          width: 350,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, greyAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 40,
                    child: Image.asset(iconName),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    textInfo,
                    style: GoogleFonts.getFont('Roboto',
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    valueInfo,
                    style: GoogleFonts.getFont('Roboto',
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
