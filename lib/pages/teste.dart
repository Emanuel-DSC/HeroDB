import 'package:dio/dio.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:herodb/pages/search.dart';
import 'package:herodb/widgets/back_card/back_card.dart';
import 'package:herodb/widgets/front_card/front_card.dart';
import '../constants.dart';
import 'details_page.dart';

class TesteScreen extends StatefulWidget {
  const TesteScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TesteScreenState createState() => _TesteScreenState();
}

class _TesteScreenState extends State<TesteScreen> {
  List heroes = [];
  List filteredHeroes = [];

  getCountries() async {
    var response =
        await Dio().get('https://akabab.github.io/superhero-api/api/all.json');
    return response.data;
  }

  @override
  void initState() {
    getCountries().then((data) {
      setState(() {
        heroes = filteredHeroes = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bgColor,
      body: filteredHeroes.isNotEmpty
          ? Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.2, left: 12.0, right: 12.0),
                child: GestureDetector(
                  onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const SearchScreen()));
                    },
                  child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1.5,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                      ),
                      child: Center(child: Text('SEARCH HERO', style: TextStyle(color: Colors.grey),)),
                    ),
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                height: 300,
                width: 500,
                child: TinderSwapCard(
                    swipeUp: false,
                    swipeDown: false,
                    orientation: AmassOrientation.TOP,
                    totalNum: filteredHeroes.length,
                    stackNum: 5,
                    swipeEdge: 4.0,
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    minHeight: MediaQuery.of(context).size.height * 0.8,
                    cardBuilder: (context, index) {
                      var heroes = filteredHeroes[index];

                      String publisherName =
                          heroes['biography']['publisher'].toString();
                      String placeOfBirth =
                          heroes['biography']['placeOfBirth'].toString();
                      String race = heroes['appearance']['race'].toString();
                      String name = heroes['name'].toString();
                      String fullName =
                          heroes['biography']['fullName'].toString();
                      String img = heroes['images']['md'].toString();
                      String powerStats =
                          heroes['powerstats']['intelligence'].toString();
                      String powerStats2 =
                          heroes['powerstats']['strength'].toString();
                      String powerStats3 =
                          heroes['powerstats']['speed'].toString();
                      String powerStats4 =
                          heroes['powerstats']['durability'].toString();
                      String powerStats5 =
                          heroes['powerstats']['power'].toString();
                      String powerStats6 =
                          heroes['powerstats']['combat'].toString();

                      //conditions to correct the API mistakes
                      if (publisherName == 'Marvel Comics' ||
                          publisherName == 'She-Thing' ||
                          publisherName == 'Rune King Thor' ||
                          publisherName == 'Ms Marvel II' ||
                          publisherName == 'Jean Grey' ||
                          publisherName == 'Archangel' ||
                          publisherName == 'Tempest' ||
                          publisherName == 'Angel Salvadore' ||
                          publisherName == 'Giant-Man' ||
                          publisherName == 'Ant-Man' ||
                          publisherName == 'Venom III' ||
                          publisherName == 'Thunderbird II' ||
                          publisherName == 'Anti-Venom' ||
                          publisherName == 'Anti-Vision' ||
                          publisherName == 'Toxin' ||
                          publisherName == 'Angel' ||
                          publisherName == 'Goliath' ||
                          publisherName == 'Binary' ||
                          publisherName == 'Evil Deadpool' ||
                          publisherName == 'Deadpool' ||
                          publisherName == 'Scorpion' ||
                          publisherName == 'Vindicator II' ||
                          publisherName == 'Icon Comics' ||
                          publisherName == 'Spider-Carnage' ||
                          publisherName == 'Flash IV' ||
                          publisherName == 'Power Woman' ||
                          publisherName == 'Power Man' ||
                          publisherName == 'Iron Lad' ||
                          publisherName == 'Phoenix') {
                        publisherName = 'Marvel Comics';
                      } else if (publisherName == 'DC Comics' ||
                          publisherName == 'Wildstorm' ||
                          publisherName == 'Aztar' ||
                          publisherName == 'Oracle' ||
                          publisherName == 'Spoiler' ||
                          publisherName == 'Nightwing' ||
                          publisherName == 'Gemini V' ||
                          publisherName == 'Batgirl V' ||
                          publisherName == 'Batgirl' ||
                          publisherName == 'Batman II' ||
                          publisherName == 'Robin II' ||
                          publisherName == 'Red Hood' ||
                          publisherName == 'Red Robin' ||
                          publisherName == 'Robin III' ||
                          publisherName == 'Black Racer' ||
                          publisherName == 'Speed Demon' ||
                          publisherName == 'Impulse' ||
                          publisherName == 'Superman Prime One-Million' ||
                          publisherName == 'Batgirl III') {
                        publisherName = 'DC Comics';
                      }

                      return FlipCard(
                        front: FrontCard(
                          name: name,
                          placeOfBirth:
                              placeOfBirth == '-' || placeOfBirth == 'null'
                                  ? placeOfBirthError
                                  : placeOfBirth,
                          race: race == 'null' ? raceError : race,
                          realname: fullName == '' ? name : fullName,
                          image: img,
                          brand: publisherName,
                          publisher: publisherName,
                        ),
                        back: BackCard(
                          powerStats: powerStats,
                          powerStats2: powerStats2,
                          powerStats3: powerStats3,
                          powerStats4: powerStats4,
                          powerStats5: powerStats5,
                          powerStats6: powerStats6,
                          onTab: () {
                            Future.delayed(const Duration(milliseconds: 400),
                                () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HeroesDetailsScreen(
                                            hero: heroes,
                                          )));
                            });
                          },
                        ),
                      );
                    }),
              ),
            ],
          )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
