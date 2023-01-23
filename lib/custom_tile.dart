import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: GestureDetector(
        onTap: onTab,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Card(
                  child: Container(
                  height: 470,
                  width: 450,
                  decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0),
                    ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      color1,
                      color2,
                    ],
                  ),
                  ),
                    child: Container(
                        height: 440,
                        width: 420,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0),
                          ),
                        image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.fill,
                      ),
                        ),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(    
                                  width: 410,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(image: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/007/306/898/small/stylish-panoramic-background-silver-steel-metal-texture-vector.jpg'),
                                    fit: BoxFit.fill),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: const Offset(0, 3),
                                      ),
                                    ], 
                                   borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(name, 
                                    style: GoogleFonts.modak(
                                      color: neutralColor,
                                      fontSize: 26),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
            Positioned(
              top: 390,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      image: DecorationImage(
                      image: NetworkImage(brand),
                      fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
