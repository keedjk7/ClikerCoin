// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:clikercoin/all_user_page.dart';
import 'package:clikercoin/brew.dart';
import 'package:clikercoin/user_data_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:clikercoin/auth_page.dart';
import 'package:clikercoin/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';
import 'cliker_page.dart';
import 'brew.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentIndex = 0;
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
        body: UserDataTile(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          currentIndex: currentIndex,
          onTap: (value) {
            print(value);
            setState(() {
              currentIndex = value;
              if (currentIndex == 1) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ClikerPage()));
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
      ),
    );
  }

  Widget buildItems(dataList) => ListView.separated(
      padding: EdgeInsets.all(8),
      itemCount: dataList.lenght,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Row(
            children: [
              Text(dataList["nameInGame"]),
              Text(dataList["haveCoin"]),
              Text(dataList["obtainCoin"]),
              Text(dataList["begger"]),
              Text(dataList["bussiessman"]),
              Text(dataList["bussiessman"])
            ],
          ),
        );
      });
}
