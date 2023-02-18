import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class GradientText extends StatelessWidget {
  GradientText({Key? key, required this.info, required this.size}) : super(key: key);
  String info;
  double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      info,
      style: GoogleFonts.getFont(
        'Lato',
        foreground: Paint()
          ..shader = LinearGradient(
            colors: <Color>[
              Colors.red.shade400,
              Colors.red.shade900,              //add more color here.
            ],
          ).createShader(const Rect.fromLTWH(0.0, 0.0, 100.0, 100.0)),
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
