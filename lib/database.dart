import 'dart:convert';
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
                      String marvel =
                          heroes['biography']['publisher'].toString();
                      return ActivityListTile(
                        name: heroes['name'].toString(),
                        level: heroes['powerstats']['intelligence'].toString(),
                        image: heroes['images']['md'],
                        brand: marvel == "Marvel Comics" ? marvelLogo : dcLogo,
                        color1:
                            marvel == "Marvel Comics" ? marvelColor : dcColor,
                        color2: Colors.white,
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
