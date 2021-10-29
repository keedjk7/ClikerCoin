// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:clikercoin/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/homePage/coinBG.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: InkWell(onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            }),
          ),
          Align(
            alignment: Alignment(-0.3, -0.65),
            child: Text(
              'Click Anythig To Continue',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
