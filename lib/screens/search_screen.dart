import 'package:dio/dio.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:herodb/constants.dart';
import 'package:herodb/widgets/back_card/back_card.dart';
import 'package:herodb/widgets/front_card/front_card.dart';
import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List heroes = [];
  List filteredHeroes = [];
  bool isSearching = true;
  bool isVisibile = false;
  final _textController = TextEditingController();

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
      isVisibile = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextField(
          controller: _textController,
          onChanged: (value) {
            _filterHeroes(value);
            if (value.isEmpty) {
              _textController.clear();
              filteredHeroes = [];
            }
          },
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.clear_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  filteredHeroes = [];
                  _textController.clear();
                });
              },
            ),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: searchHereText,
            hintStyle: const TextStyle(color: Colors.white),
          ),
          cursorWidth: 2,
          cursorColor: Colors.red.shade800,
          cursorRadius: const Radius.circular(3),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Visibility(
          visible: isVisibile,
          child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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

                return FlipCard(
                  front: FrontCard(
                    name: name,
                    placeOfBirth: placeOfBirth == '-' || placeOfBirth == 'null'
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
                );
              }),
        ),
      ),
    );
  }
}
