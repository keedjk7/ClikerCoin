// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:clikercoin/all_user_page.dart';
import 'package:clikercoin/botton_cliker.dart';
import 'package:clikercoin/profile_page.dart';
import 'package:flutter/material.dart';
import 'reset_confirm.dart';

class ClikerPage extends StatefulWidget {
  const ClikerPage({Key? key}) : super(key: key);

  @override
  _ClikerPageState createState() => _ClikerPageState();
}

class _ClikerPageState extends State<ClikerPage> {
  int currentIndex = 1;

  void _showResetPanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: ResetConfirm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Profile'),
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              _showResetPanel();
            },
            icon: Icon(Icons.restore),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            label: Text('Reset'),
          ),
        ],
      ),
      body: PageView(
        children: [
          Column(
            children: [
              Container(
                color: Colors.brown,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BottonCliker(),
              ),
            ],
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
            if (currentIndex == 0) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            } else if (currentIndex == 2) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AllUserPage()));
            }
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined), label: 'profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined), label: 'cliker'),
          BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined), label: 'all user'),
        ],
      ),
    );
  }
}
