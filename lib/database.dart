import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:herodb/constants.dart';
import 'package:herodb/heroes_details.dart';
import 'package:http/http.dart' as http;
import 'custom_tile.dart';

class DataBase extends StatefulWidget {
  DataBase({Key? key}) : super(key: key);

  State<DataBase> createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase> {
  //PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getHeroes(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller:
                        PageController(initialPage: 0, viewportFraction: 0.85),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var heroes = snapshot.data![index];

                      //condintions to custom colors and image

                      String publisherName =
                          heroes['biography']['publisher'].toString();
                      Color mainColor = Colors.transparent;
                      Color secondColor = Colors.transparent;

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
                        publisherName = marvelLogo;
                        mainColor = marvelColor;
                        secondColor = whiteColor;
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
                        publisherName = dcLogo;
                        mainColor = dcColor;
                        secondColor = whiteColor;
                      } else if (publisherName == 'NBC - Heroes') {
                        publisherName = nbcLogo;
                        mainColor = yellowColor;
                        secondColor = nbcColor2;
                      } else if (publisherName == 'Microsoft') {
                        publisherName = microsoftLogo;
                        mainColor = marvelColor;
                        secondColor = dcColor;
                      } else if (publisherName == 'SyFy') {
                        publisherName = syfyLogo;
                        mainColor = syfyColor;
                        secondColor = whiteColor;
                      } else if (publisherName == 'George Lucas') {
                        publisherName = georgeLucasLogo;
                        mainColor = whiteColor;
                        secondColor = georgeColor;
                      } else if (publisherName == 'Meltdown') {
                        publisherName = meltdownLogo;
                        mainColor = meltdownColor1;
                        secondColor = meltdownColor2;
                      } else if (publisherName == 'South Park') {
                        publisherName = southParkLogo;
                        mainColor = southParkColor;
                        secondColor = blackColor;
                      } else if (publisherName == 'Universal Studios') {
                        publisherName = universalStudiosLogo;
                        mainColor = universalStudioColor;
                        secondColor = whiteColor;
                      } else if (publisherName == 'Star Trek') {
                        publisherName = starTrekLogo;
                        mainColor = yellowColor;
                        secondColor = whiteColor;
                      } else if (publisherName == 'IDW Publishing' ||
                          publisherName == 'Sony Pictures' ||
                          publisherName == 'Image Comics' ||
                          publisherName == 'ABC Studios') {
                        mainColor = blackColor;
                        secondColor = whiteColor;
                        if (publisherName == 'IDW Publishing') {
                          publisherName = idwLogo;
                        } else if (publisherName == 'Sony Pictures') {
                          publisherName = sonyLogo;
                        } else if (publisherName == 'Image Comics') {
                          publisherName = imageComicsLogo;
                        } else {
                          publisherName = abcStudiosLogo;
                        }
                      } else if (publisherName == 'Shueisha' ||
                          publisherName == 'Dark Horse Comics') {
                        mainColor = whiteColor;
                        secondColor = blackColor;
                        if (publisherName == 'Shueisha') {
                          publisherName = shueishaLogo;
                        } else {
                          publisherName = darkHorseLogo;
                        }
                      } else {
                        publisherName = publisherImgNull;
                      }

                      return ActivityListTile(
                        name: heroes['name'].toString(),
                        level: heroes['powerstats']['intelligence'].toString(),
                        image: heroes['images']['md'] ?? heroImgNull,
                        brand: publisherName,
                        color1: mainColor,
                        color2: secondColor,
                        onTab: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HeroesDetailsScreen(hero: heroes),
                            ),
                          );
                        },
                      );
                    }),
              ),
              /*Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        pageController.previousPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                      child: const Text('Back'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        pageController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),*/
            ],
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  Future<List> getHeroes() async {
    var url = 'https://akabab.github.io/superhero-api/api/all.json';
    var res = await http.get(Uri.parse(url));
    List decodedJson = jsonDecode(res.body);
    List heros = [];
    int code = res.statusCode;
    if (code == 200) {
      heros = decodedJson;
    } else {
      const Center(child: Text("Something went wrong"));
    }
    return heros;
  }
}
