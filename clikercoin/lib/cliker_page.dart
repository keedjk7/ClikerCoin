// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

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
                child: ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    width: 180,
                    height: 180,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Icon(
                      Icons.monetization_on_outlined,
                      size: 100,
                      color: Colors.amber[700],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    primary: Colors.amber[100],
                    onPrimary: Colors.red[600],
                  ),
                ),
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
            }
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
