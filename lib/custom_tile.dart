import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:herodb/constants.dart';

class ActivityListTile extends StatelessWidget {
  String name;
  String level;
  String image;
  String brand;
  Color color1;
  Color color2;
  VoidCallback onTab;

  ActivityListTile(
      {super.key,
      required this.name,
      required this.brand,
      required this.onTab,
      required this.level,
      required this.color1,
      required this.color2,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 36, 8, 16),
      child: GestureDetector(
        onTap: onTab,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Card(
              child: Container(
                height: 450,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(5, 11),
                      spreadRadius: 0,
                      blurRadius: 30,
                      color: Colors.black87,
                    ),
                  ],
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.fill),
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [color1, color2], 
                      begin: Alignment.bottomCenter, 
                      end: Alignment.topCenter),
                    width: 8,
                  ),
                  color: Colors.grey[800],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 280,
                          height: 35,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://static.vecteezy.com/system/resources/thumbnails/007/306/898/small/stylish-panoramic-background-silver-steel-metal-texture-vector.jpg'),
                                fit: BoxFit.fill),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              name,
                              style: GoogleFonts.getFont('Rubik Mono One',
                                  color: cardTextColor, fontSize: 26),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 335),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(brand), fit: BoxFit.fill),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
