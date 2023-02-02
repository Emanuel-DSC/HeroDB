import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:herodb/constants.dart';
import 'package:herodb/widgets/powerstat.dart';

// ignore: must_be_immutable
class ActivityListTile extends StatelessWidget {
  String name;
  String powerStats;
  String powerStats2;
  String powerStats3;
  String powerStats4;
  String powerStats5;
  String powerStats6;
  String image;
  String brand;
  Color color1;
  Color color2;
  VoidCallback onTab;

  ActivityListTile(
      {super.key,
      required this.name,
      required this.powerStats,
      required this.powerStats2,
      required this.powerStats3,
      required this.powerStats4,
      required this.powerStats5,
      required this.powerStats6,
      required this.brand,
      required this.onTab,
      required this.color1,
      required this.color2,
      required this.image});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 36, 8, 16),
      child: GestureDetector(
        onTap: onTab,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 650,
                    width: 380,
                    decoration: BoxDecoration(
                      border: Border.all(color: blackColor, width: 8),
                      color: blackColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 600,
                      width: 350,
                      decoration: BoxDecoration(
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [color1, color2],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                          width: 2,
                        ),
                        color: blackColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 4, left: 4, right: 4),
                            child: Container(
                              height: height * 0.38,
                              width: width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: height * 0.675,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, top: 12),
                              child: Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: NetworkImage(brand)),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.385,
                            child: Container(
                              width: 345,
                              height: 12,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(texture),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            name,
                            style: GoogleFonts.getFont(
                              'Rubik Mono One',
                              color: whiteColor,
                              fontSize: 24,
                              shadows: const [
                                BoxShadow(
                                  offset: Offset(3, 7),
                                  spreadRadius: -3,
                                  blurRadius: 12,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ],
                            ),
                          )),
                          PowerList(
                              height: height,
                              statsHeight: 0.4,
                              iconName: brainImg,
                              textInfo: powerStatsText,
                              valueInfo: powerStats),
                          PowerList(
                            height: height,
                            statsHeight: 0.455,
                            iconName: armImg,
                            textInfo: powerStatsText2,
                            valueInfo: powerStats2,
                          ),
                          PowerList(
                            height: height,
                            statsHeight: 0.51,
                            iconName: personImg,
                            textInfo: powerStatsText3,
                            valueInfo: powerStats3,
                          ),
                          PowerList(
                            height: height,
                            statsHeight: 0.565,
                            iconName: shieldImg,
                            textInfo: powerStatsText4,
                            valueInfo: powerStats4,
                          ),
                          PowerList(
                            height: height,
                            statsHeight: 0.62,
                            iconName: superpowerImg,
                            textInfo: powerStatsText5,
                            valueInfo: powerStats5,
                          ),
                          PowerList(
                            height: height,
                            statsHeight: 0.675,
                            iconName: boxingImg,
                            textInfo: powerStatsText6,
                            valueInfo: powerStats6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
