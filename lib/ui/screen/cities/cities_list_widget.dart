import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entity/city.dart';

class CitiesListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CitiesListScreenState();
  }
}

class CitiesListScreenState extends State {
  String rawJson = "";

  @override
  void initState() {
    extractJson().then((value) {
      //rawJson = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GDG Everywhere'),
        automaticallyImplyLeading: false,
      ),
      body: Text(
        rawJson,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Future<List<City>> extractJson() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("res/assets/cities.json");
    Map<String, dynamic> decodedJson = jsonDecode(data);
    //final jsonResult = json.decode(data);
    CityList cityList = CityList.fromMappedJson(decodedJson);
    print("city list = ${cityList.citiesList.toString()}");
    for (City city in cityList.citiesList) {
      print("1111 city = ${city.name}");
    }
    //return jsonResult;
  }
}
