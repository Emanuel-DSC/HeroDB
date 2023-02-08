import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class CircleNumber extends StatelessWidget {
  const CircleNumber({
    Key? key,
    required this.powerStatsValue,
  }) : super(key: key);

  final String powerStatsValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey,
            width: 1.5,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(50),
        color: blackColor,
      ),
      child: Center(child: Text(powerStatsValue, style: GoogleFonts.getFont(
            'Roboto',
            color: whiteColor,
            fontSize: 14,),),),
    );
  }
}


    