import 'package:card_swiper/card_swiper.dart';
import 'package:dio/dio.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:herodb/screens/search_screen.dart';
import 'package:herodb/widgets/back_card/back_card.dart';
import 'package:herodb/widgets/front_card/front_card.dart';
import '../constants.dart';
import '../widgets/gradient_text.dart';
import 'details_screen.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  List heroes = [];
  List filteredHeroes = [];

  getHeroes() async {
    var response =
        await Dio().get('https://akabab.github.io/superhero-api/api/all.json');
    return response.data;
  }

  @override
  void initState() {
    getHeroes().then((data) {
      setState(() {
        heroes = filteredHeroes = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: GradientText(info: appTitle, size: 32,),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SearchScreen()));
            },
          ),
        ],
      ),
      body: filteredHeroes.isNotEmpty
          ? Center(
              child: SizedBox(
                height: 300,
                width: 500,
                child: Swiper(
                    itemCount: heroes.length,
                    itemWidth: MediaQuery.of(context).size.width,
                    itemHeight: MediaQuery.of(context).size.height,
                    layout: SwiperLayout.TINDER,
                    pagination: SwiperPagination(
                        builder: FractionPaginationBuilder(
                            activeFontSize: 25.0,
                            fontSize: 15.0,
                            color: whiteColor,
                            activeColor: Colors.red.shade500)),
                    itemBuilder: (context, index) {
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
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.red.shade900,
                backgroundColor: Colors.grey.shade600,
              ),
            ),
    );
  }
}
