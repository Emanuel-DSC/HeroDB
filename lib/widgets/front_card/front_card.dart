import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodb/constants.dart';
import 'front_card_info.dart';

// ignore: must_be_immutable
class FrontCard extends StatelessWidget {
  String name;
  String publisher;
  String placeOfBirth;
  String race;
  String realname;
  String image;
  String brand;
  

  FrontCard(
      {super.key,
      required this.name,
      required this.publisher,
      required this.placeOfBirth,
      required this.race,
      required this.realname,
      required this.brand,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            height: 240,
            width: 480,
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              children: [
                 Container(
                    height: 380,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.fill),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Row(children: [
                              Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              name,
                              style: GoogleFonts.getFont(
                                  'Fredericka the Great',
                                  color: whiteColor,
                                  fontSize: 22),
                            ),
                          ),
                             
                          ],
                          ),
                          const SizedBox(height: 30),
                          FrontCardWidget(
                            info: realNameText,
                            secondInfo: realname,
                          ),
                          const SizedBox(height: 10),
                          FrontCardWidget(
                            info: raceText,
                            secondInfo: race,
                          ),
                          const SizedBox(height: 10),
                          FrontCardWidget(
                            info: placeOfBirthTitle,
                            secondInfo: placeOfBirth,
                          ),
                          const SizedBox(height: 10),
                          FrontCardWidget(
                            info: publisherText,
                            secondInfo: publisher,
                          ),
                          const SizedBox(height: 5),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                Icons.sync,
                                color: whiteColor,
                              ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
      ),
    ]));
  }
}
