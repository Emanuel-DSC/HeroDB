import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DetailsPageText extends StatelessWidget {
  const DetailsPageText({
    Key? key,
    required this.info,
  }) : super(key: key);

  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          info,
          style: GoogleFonts.getFont(
            'Roboto',
            fontSize: 18,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
