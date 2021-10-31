// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:clikercoin/database.dart';
import 'package:clikercoin/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottonCliker extends StatefulWidget {
  const BottonCliker({Key? key}) : super(key: key);

  @override
  _BottonClikerState createState() => _BottonClikerState();
}

class _BottonClikerState extends State<BottonCliker> {
  final _formKey = GlobalKey<FormState>();

  late String _currentName;
  late int _currentHaveCoin;
  late int _currentObtainCoin;
  late int _currentBegger;
  late int _currentBussiessman;
  late int _currentCompany;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData? userData = snapshot.data;

          return ElevatedButton(
            onPressed: () async {
              _currentName = userData!.uid;
              _currentHaveCoin = userData.haveCoin +
                  1 +
                  (userData.begger) +
                  (userData.bussiessman * 10) +
                  (userData.company * 50);
              _currentObtainCoin = userData.obtainCoin +
                  1 +
                  (userData.begger) +
                  (userData.bussiessman * 10) +
                  (userData.company * 50);
              _currentBegger = userData.begger;
              _currentBussiessman = userData.bussiessman;
              _currentCompany = userData.company;
              if (_formKey.currentState!.validate()) {
                await DatabaseService(uid: user.uid).updateUserData(
                  _currentName,
                  _currentObtainCoin,
                  _currentHaveCoin,
                  _currentBegger,
                  _currentBussiessman,
                  _currentCompany,
                );
              }
            },
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
          );
        });
  }
}
