import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodb/screens/card_screen.dart';
import 'package:herodb/widgets/gradient_text.dart';
import '../constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: bgColor,
          ),
          Image.asset(homeCoverImg,
              width: double.infinity, height: height * 0.5, fit: BoxFit.cover),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    bgColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.3, 0.5],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.55,
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GradientText(
                    info: appTitle,
                    size: 46,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    homeText1.toUpperCase(),
                    style: GoogleFonts.getFont('Inter',
                        color: Colors.grey, fontSize: 18, 
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    homeText2,
                    style: GoogleFonts.getFont(
                      'Inter',
                      color: whiteColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    homeText3,
                    style: GoogleFonts.getFont(
                      'Inter',
                      color: whiteColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AnimatedButton(
                    height: 35,
                    width: 120,
                    text: 'START',
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
                    onPress: () {
                      Future.delayed(const Duration(milliseconds: 400), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CardsScreen()));
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
