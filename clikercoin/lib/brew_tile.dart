// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'brew.dart';

class BrewTile extends StatelessWidget {
  //const BrewTile({Key? key}) : super(key: key);

  final Brew brew;
  BrewTile({Key? key, required this.brew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.lime[300],
          ),
          title: Text(brew.nameInGame),
          subtitle: Text(
              'Money\n  Current : ${brew.haveCoin} \n  Obtained : ${brew.obtainCoin}'),
        ),
      ),
    );
  }
}
