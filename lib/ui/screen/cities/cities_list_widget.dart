import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/entity/city.dart';
import 'package:flutter_app/ui/screen/city_details/city_details.dart';

class CitiesListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CitiesListScreenState();
  }
}

class CitiesListScreenState extends State {
  List<City> cities = List();

  @override
  void initState() {
    parseCitiesList().then((value) {
      setState(() {
        cities = value;
      });
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
      body: ListView.builder(
        itemCount: cities != null ? cities.length : 0,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CityDetailsScreen(
                          cityName: cities[index].name,
                          photoUrl: cities[index].imageUrl,
                          description: cities[index].description,
                          index: index,
                        )),
              );
            },
            child: CustomListItem(
              imageUrl: cities[index].imageUrl,
              name: cities[index].name,
              index: index,
            ),
          );
        },
      ),
    );
  }

  Future<List<City>> parseCitiesList() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("res/assets/cities.json");
    Map<String, dynamic> decodedJson = jsonDecode(data);
    CityList cityList = CityList.fromMappedJson(decodedJson);
    return cityList.citiesList;
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({this.imageUrl, this.name, this.index});

  final String imageUrl;
  final String name;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Hero(
              tag: 'photo{$index}',
              child: Container(
                height: 120.0,
                width: 120.0,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
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
