// ignore_for_file: prefer_const_constructors

import 'package:clikercoin/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user.dart';

class UserDataTile extends StatefulWidget {
  const UserDataTile({Key? key}) : super(key: key);

  @override
  _UserDataTileState createState() => _UserDataTileState();
}

class _UserDataTileState extends State<UserDataTile> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final user = Provider.of<User>(context, listen: false);
      return StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            UserData? userData = snapshot.data;
            return Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.lime[300],
                  ),
                  title: Text(
                      'Name : ${userData!.uid}  \nMoney Current : ${userData.haveCoin}  \nObtained : ${userData.obtainCoin}  \nProperty :  \n  Begger : ${userData.begger}  \n  Bussinessman : ${userData.bussiessman}  \n  Companny : ${userData.company}'),
                ),
              ),
            );
          });
    });
  }
}
