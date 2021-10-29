// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class ClikerPage extends StatefulWidget {
  const ClikerPage({Key? key}) : super(key: key);

  @override
  _ClikerPageState createState() => _ClikerPageState();
}

class _ClikerPageState extends State<ClikerPage> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Colors.brown,
          ),
          Container(color: Colors.amber)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: currentIndex,
        onTap: (value) {
          print(value);
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined), label: 'profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined), label: 'cliker'),
        ],
      ),
    );
  }
}
