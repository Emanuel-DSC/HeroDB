import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:herodb/constants.dart';
import 'package:http/http.dart' as http;
import 'custom_tile.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: FutureBuilder<dynamic>(
        future: getHeroes(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var heros = snapshot.data![index];
                  String marvel = heros['biography']['publisher'];
                  return ActivityListTile(
                    name: heros['name'].toString(),
                    level: heros['powerstats']['intelligence'].toString(),
                    image: heros['images']['md'],
                    brand: marvel == "Marvel Comics" ? marvelLogo : dcLogo,
                    color1: marvel == "Marvel Comics" ? marvelColor : dcColor,
                    color2: Colors.white,
                    onTab: () {},
                  );
                });
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
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
