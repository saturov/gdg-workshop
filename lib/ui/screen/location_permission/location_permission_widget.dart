import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationPermissionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocationPermissionState();
  }
}

class LocationPermissionState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Мы должны получить\nдоступ к геолокации',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () => {
                      //todo ask for the location permission
                    },
                    child: Text(
                      'Замечательно',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
