import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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