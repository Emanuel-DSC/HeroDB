import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class DetailsPageTitle extends StatelessWidget {
  const DetailsPageTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: GoogleFonts.getFont('Roboto',
              fontSize: 24, color: whiteColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
