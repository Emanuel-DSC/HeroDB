import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodb/constants.dart';
import 'package:herodb/widgets/details_text.dart';
import 'package:herodb/widgets/details_title.dart';

// ignore: must_be_immutable
class HeroesDetailsScreen extends StatelessWidget {
  HeroesDetailsScreen({super.key, required this.hero});
  Map<String, dynamic> hero;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    String placeOfBirth = hero['biography']['placeOfBirth'].toString();
    String base = hero['work']['base'].toString();
    String groupAffiliation = hero['connections']['groupAffiliation'].toString();
    String relatives = hero['connections']['relatives'].toString();
    String firstAppearence = hero['biography']['firstAppearance'].toString();
    String occupation = hero['work']['occupation'].toString();

    return Scaffold(
      backgroundColor: Colors.grey[800],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.red, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height * 0.4,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(hero['images']['md']),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.37,
                    child: Container(
                      height: 30,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    hero['biography']['fullName'].toString() == ''
                        ? hero['name']
                        : hero['biography']['fullName'].toString(),
                    style: GoogleFonts.getFont(
                      'Inter',
                      color: whiteColor,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      shadows: const [
                        BoxShadow(
                          offset: Offset(1, 4),
                          spreadRadius: -1,
                          blurRadius: 5,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DetailsPageTitle(title: detailsAlterEgo),
              const SizedBox(height: 10),
              DetailsPageText(info: hero['biography']['alterEgos']),
              const SizedBox(height: 30),
              DetailsPageTitle(title: placeOfBirthTitle),
              const SizedBox(height: 10),
              DetailsPageText(
                  info: placeOfBirth == '-' || placeOfBirth == 'null'
                      ? placeOfBirthError
                      : placeOfBirth),
              const SizedBox(height: 30),
              DetailsPageTitle(title: firstAppearenceTitle),
              const SizedBox(height: 10),
              DetailsPageText(
                  info: firstAppearence == '-' || firstAppearence == 'null'
                      ? firstAppearenceError
                      : firstAppearence),
              const SizedBox(height: 30),
              DetailsPageTitle(title: occupationTitle),
              const SizedBox(height: 10),
              DetailsPageText(
                  info: occupation == '-' || occupation == 'null'
                      ? occupationError
                      : occupation),
              const SizedBox(height: 30),
              DetailsPageTitle(title: baseTitle),
              const SizedBox(height: 10),
              DetailsPageText(
                  info: base == '-' || base == 'null' ? baseError : base),
              const SizedBox(height: 30),
              DetailsPageTitle(title: groupAffiliationTitle),
              const SizedBox(height: 10),
              DetailsPageText(
                  info: groupAffiliation == '-' || groupAffiliation == 'null'
                      ? groupAffiliationError
                      : groupAffiliation),
              const SizedBox(height: 30),
              DetailsPageTitle(title: relativesTitle),
              const SizedBox(height: 10),
              DetailsPageText(
                  info: relatives == '-' || relatives == 'null'
                      ? relativesError
                      : relatives),
            ],
          ),
        ),
      ),
    );
  }
}
