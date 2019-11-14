import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/entity/city.dart';
import 'package:http/http.dart' as http;

class CitiesListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CitiesListScreenState();
  }
}

class CitiesListScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GDG Everywhere'),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<http.Response>(
        future: http.get('https://api.myjson.com/bins/ao7w6'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final http.Response response = snapshot.data;
          final List<City> cities = decodeCitiesJson(response.body);

          return ListView.builder(
            itemCount: cities != null ? cities.length : 0,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  /// todo navigate to city details screen
                },
                child: CustomListItem(
                  imageUrl: cities[index].imageUrl,
                  name: cities[index].name,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<City>> parseCitiesList() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("res/assets/cities.json");
    return decodeCitiesJson(data);
  }

  List<City> decodeCitiesJson(String rawData) {
    Map<String, dynamic> decodedJson = jsonDecode(rawData);
    CityList cityList = CityList.fromMappedJson(decodedJson);
    return cityList.citiesList;
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.imageUrl,
    this.name,
  });

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              height: 120.0,
              width: 120.0,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                name,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
