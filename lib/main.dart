import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/assets/assets.dart';
import 'package:flutter_app/ui/styles/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: Container(
        color: Colors.blue,
        child: FlareActor(
          flrSplashLogo,
          animation: 'Untitled',
          callback: (name) {
            //todo навигация на экран запроса гео-пермишна
          },
        ),
      ),
    );
  }
}