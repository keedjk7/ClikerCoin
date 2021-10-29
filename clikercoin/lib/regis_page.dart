// ignore_for_file: prefer_const_constructors, unused_field, avoid_print, unused_local_variable

import 'package:clikercoin/auth_page.dart';
import 'package:clikercoin/database.dart';
import 'package:clikercoin/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:clikercoin/home_page.dart';
import 'package:clikercoin/database.dart';

class RegistorPage extends StatefulWidget {
  const RegistorPage({Key? key}) : super(key: key);

  @override
  _RegistorPageState createState() => _RegistorPageState();
}

class _RegistorPageState extends State<RegistorPage> {
  late String id, _password, _nameGame;
  final auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? HomePage()
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => AuthPage()));
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.green,
                ),
              ),
              title: Center(
                child: Text(
                  'Registor',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0), //space from corner
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Email", hintText: "Insert your email here"),
                    onChanged: (value) {
                      setState(() {
                        id = value.trim();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password", hintText: "insert password"),
                      onChanged: (value) {
                        setState(() {
                          _password = value.trim();
                        });
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: "Name In Game",
                          hintText: "Insert name game"),
                      onChanged: (value) {
                        setState(() {
                          _nameGame = value.trim();
                        });
                      }),
                ),
                ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        UserCredential result =
                            await auth.createUserWithEmailAndPassword(
                                email: id, password: _password);
                        await DatabaseService(uid: result.user!.uid)
                            .updateUserData(_nameGame, 0, 0, 0, 0, 0);
                        setState(() => loading = true);
                        print("Register!");
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ProfilePage()));
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          loading = false;
                        });
                        print(e.message);
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 24),
                    )),
              ],
            ),
          );
  }
}
