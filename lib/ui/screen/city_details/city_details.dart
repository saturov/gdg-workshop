import 'package:flutter/material.dart';

class CityDetailsScreen extends StatelessWidget {
  final String cityName;
  final String photoUrl;
  final String description;
  final int index;

  CityDetailsScreen({
    Key key,
    this.cityName,
    this.photoUrl,
    this.description,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(cityName),
              background: Hero(
                tag: 'photo{$index}',
                child: Image.network(
                  photoUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description),
        ),
      ),
    );
  }
}
