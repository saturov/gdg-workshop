import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/assets/assets.dart';
import 'package:flutter_app/ui/styles/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: FlareActor(
          //todo add Flare file
          flrSplashLogo,
          animation: 'Untitled',
          //callback: wm.onAnimationCompleted,
        ),
      ),
    );
  }
}