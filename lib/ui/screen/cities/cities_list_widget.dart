import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      rawJson = value;
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

  Future<String> extractJson() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("res/assets/cities.json");
    final jsonResult = json.decode(data);
    return jsonResult;
  }
}
