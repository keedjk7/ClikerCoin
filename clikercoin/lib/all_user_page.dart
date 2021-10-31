// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:clikercoin/brew.dart';
import 'package:clikercoin/database.dart';
import 'package:clikercoin/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_page.dart';
import 'brew_list.dart';
import 'cliker_page.dart';

class AllUserPage extends StatefulWidget {
  const AllUserPage({Key? key}) : super(key: key);

  @override
  _AllUserPageState createState() => _AllUserPageState();
}

class _AllUserPageState extends State<AllUserPage> {
  int currentIndex = 2;
  final auth = FirebaseAuth.instance;
  // List dataList = [];

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      initialData: [],
      value: DatabaseService(uid: '').brews,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Profile'),
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                try {
                  await auth.signOut();
                  print("LogOut!");
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => AuthPage()));
                } on FirebaseAuthException catch (e) {
                  print(e.message);
                }
              },
              icon: Icon(Icons.logout),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              label: Text('Logout'),
            ),
          ],
        ),
        body: BrewList(),
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
              } else if (currentIndex == 1) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ClikerPage()));
              }
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_outlined), label: 'cliker'),
            BottomNavigationBarItem(
                icon: Icon(Icons.description_outlined), label: 'all user'),
          ],
        ),
      ),
    );
  }
}
