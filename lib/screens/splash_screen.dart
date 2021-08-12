import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/models/news_api.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: double.infinity,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://i.pinimg.com/originals/e9/11/70/e91170f13c00f6484fc957d5429d8179.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
