import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class FrontCardWidget extends StatelessWidget {
  const FrontCardWidget({
    Key? key,
    required this.info, required this.secondInfo,
  }) : super(key: key);

  final String info;
  final String secondInfo;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: info,
                style: GoogleFonts.getFont(
            'Roboto',
            color: Colors.grey[500],
            fontSize: 14, fontWeight: FontWeight.bold),),
            TextSpan(
                text: secondInfo,
               style: GoogleFonts.getFont(
            'Roboto',
            color: whiteColor,
            fontSize: 14,),),
          ],
        ),
      ),
    );
  }
}