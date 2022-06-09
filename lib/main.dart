// @dart=2.9

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:interested_two/sign_in.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      home: splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class splash extends StatefulWidget {
  const splash({Key key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
     super.initState();
     Timer(Duration(seconds: 2),
         ()=>Navigator.pushReplacement(context,
         MaterialPageRoute(builder: (context)=>
          SignIn())));
  }

  @override
  Widget build(BuildContext context) {

    Color textr = Color(0xFFFF0048);

    return Scaffold(
      backgroundColor: Color(0xFF131419),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedT(textr, 20.0, "INTERESTED", FontWeight.normal),
            AnimatedT(
                Colors.white, 30.0, "be one!", FontWeight.bold),
          ],
        ),
      ),
    );
  }


}


class AnimatedT extends StatelessWidget {
  AnimatedT(this.color, this.size, this.text, this.w);

  String text;
  double size;
  Color color;
  FontWeight w;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'mons',
          fontWeight: w
      ),);
  }
}

