import 'dart:async';

import 'package:consest/ceaser.dart';
import 'package:consest/ceaserFront.dart';
import 'package:consest/ceaserTest.dart';
import 'package:consest/otp.dart';
import 'package:consest/otpfornt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'CONTEST';
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.deepPurpleAccent.shade700,
      body: SizedBox(
        width: double.infinity,
        child: Column(children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                width: 230,
                height: 240,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 20),
                        blurRadius: 30,
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(200),
                      bottomLeft: Radius.circular(200),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/conpic.jpg'),
                      fit: BoxFit.cover,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "PRESENTS ",
            style: TextStyle(
              fontSize: 30,
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "D'DCODE",
            style: TextStyle(
              fontSize: 30,
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 103,
          ),
          Column(children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  width: 210,
                  height: 240,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 20),
                          blurRadius: 20,
                          spreadRadius: 0,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                        topRight: Radius.circular(200),
                        bottomRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/TINT.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
          ]),
        ]),
      ),
    );
  }

  @override
  void iniState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CeaserFont())));
  }
}
