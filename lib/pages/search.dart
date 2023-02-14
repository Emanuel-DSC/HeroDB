import 'package:dio/dio.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:herodb/constants.dart';
import 'package:herodb/pages/swipe.dart';
import 'package:herodb/widgets/back_card/back_card.dart';
import 'package:herodb/widgets/front_card/front_card.dart';

import 'details_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List heroes = [];
  List filteredHeroes = [];
  bool isSearching = false;

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

  void _filterHeroes(value) {
    setState(() {
      filteredHeroes = heroes
          .where((hero) =>
              hero['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: !isSearching
            ? Text('All Countries')
            : TextField(
                onChanged: (value) {
                  _filterHeroes(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search Country Here",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      filteredHeroes = heroes;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: filteredHeroes.isNotEmpty
            ? ListView.builder(
                itemCount: filteredHeroes.length,
                itemBuilder: (BuildContext context, int index) {
                  var heroesInfo = filteredHeroes[index];
                  String publisherName =
                      heroesInfo['biography']['publisher'].toString();
                  String placeOfBirth =
                      heroesInfo['biography']['placeOfBirth'].toString();
                  String race = heroesInfo['appearance']['race'].toString();
                  String name = heroesInfo['name'].toString();
                  String fullName =
                      heroesInfo['biography']['fullName'].toString();
                  String img = heroesInfo['images']['md'].toString();
                  String powerStats =
                      heroesInfo['powerstats']['intelligence'].toString();
                  String powerStats2 =
                      heroesInfo['powerstats']['strength'].toString();
                  String powerStats3 =
                      heroesInfo['powerstats']['speed'].toString();
                  String powerStats4 =
                      heroesInfo['powerstats']['durability'].toString();
                  String powerStats5 =
                      heroesInfo['powerstats']['power'].toString();
                  String powerStats6 =
                      heroesInfo['powerstats']['combat'].toString();

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => HeroesDetailsScreen(
                                    hero: heroesInfo,
                                  )));
                    },
                    child: FlipCard(
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
                          Future.delayed(const Duration(milliseconds: 400), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HeroesDetailsScreen(
                                          hero: heroesInfo,
                                        )));
                          });
                        },
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
