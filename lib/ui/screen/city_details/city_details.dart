import 'dart:math' as math;

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Объем коммъюнити: "),
                    _LoadCountButton()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadCountButton extends StatefulWidget {
  @override
  __LoadCountButtonState createState() => __LoadCountButtonState();
}

class __LoadCountButtonState extends State<_LoadCountButton> {
  bool _loading = false;
  int _communityCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      child: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _communityCount != null
              ? Center(
                  child: Text("$_communityCount"),
                )
              : FlatButton(
                  onPressed: _loadData,
                  child: Text("Узнать"),
                ),
    );
  }

  void _loadData() async {
    setState(() {
      _loading = true;
    });

    var res = await Future.delayed(
      Duration(seconds: 2),
      () => (math.Random().nextDouble() * 100).toInt(),
    );

    setState(() {
      _communityCount = res;
      _loading = false;
    });
  }
}
