import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodb/constants.dart';
import 'package:herodb/widgets/back_card/circle_stats.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

// ignore: must_be_immutable
class BackCard extends StatelessWidget {
  String powerStats;
  String powerStats2;
  String powerStats3;
  String powerStats4;
  String powerStats5;
  String powerStats6;
  VoidCallback onTab;
  BackCard({
    super.key,
    required this.onTab,
    required this.powerStats,
    required this.powerStats2,
    required this.powerStats3,
    required this.powerStats4,
    required this.powerStats5,
    required this.powerStats6,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        // onTap: onTab,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 250,
                width: 480,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleNumber(powerStatsValue: powerStats),
                            const SizedBox(height:  5),
                            Text(
                              powerStatsText,
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: whiteColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height:  5),
                            CircleNumber(powerStatsValue: powerStats2),
                            const SizedBox(height:  5),
                            Text(
                              powerStatsText2,
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: whiteColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleNumber(powerStatsValue: powerStats3),
                            const SizedBox(height:  5),
                            Text(
                              powerStatsText3,
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: whiteColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height:  5),
                            CircleNumber(powerStatsValue: powerStats4),
                            const SizedBox(height:  5),
                            Text(
                              powerStatsText4,
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: whiteColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleNumber(powerStatsValue: powerStats5),
                            const SizedBox(height:  5),
                            Text(
                              powerStatsText5,
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: whiteColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height:  5),
                            CircleNumber(powerStatsValue: powerStats6),
                            const SizedBox(height:  5),
                            Text(
                              powerStatsText6,
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: whiteColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: AnimatedButton(
                          height: 25,
                          width: 100,
                          text: 'SEE MORE',
                          isReverse: true,
                          selectedTextColor: Colors.white,
                          transitionType: TransitionType.LEFT_TO_RIGHT,
                          textStyle: GoogleFonts.getFont(
                                'Roboto',
                                color: whiteColor,
                                fontSize: 14,
                              ),
                          borderColor: Colors.grey,
                          borderRadius: 50,
                          borderWidth: 1,
                          backgroundColor: blackColor,
                          selectedGradientColor: LinearGradient(
                          colors: [Colors.red.shade600, Colors.red.shade900]),
                          onPress: onTab,
                        ),
                      ),
                  ],),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
