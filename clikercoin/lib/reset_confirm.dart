// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:clikercoin/database.dart';
import 'package:clikercoin/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetConfirm extends StatefulWidget {
  const ResetConfirm({Key? key}) : super(key: key);

  @override
  _ResetConfirmState createState() => _ResetConfirmState();
}

class _ResetConfirmState extends State<ResetConfirm> {
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

          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text('Are you sure to reset all'),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
                  child: ElevatedButton(
                    onPressed: () async {
                      _currentName = userData!.uid;
                      _currentHaveCoin = 0;
                      _currentObtainCoin = 0;
                      _currentBegger = 0;
                      _currentBussiessman = 0;
                      _currentCompany = 0;
                      if (_formKey.currentState!.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                          _currentName,
                          _currentObtainCoin,
                          _currentHaveCoin,
                          _currentBegger,
                          _currentBussiessman,
                          _currentCompany,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Confirm',
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
