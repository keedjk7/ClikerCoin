// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:clikercoin/home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late String id, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.pinkAccent),
          ),
        ),
        backgroundColor: Colors.lime,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //set center
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
          ElevatedButton.icon(
              onPressed: () async {
                try {
                  await auth.createUserWithEmailAndPassword(
                      email: id, password: _password);
                  print("Register!");
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                } on FirebaseAuthException catch (e) {
                  print(e.message);
                }
              },
              icon: const Icon(Icons.add),
              label: const Text(
                "Register",
                style: TextStyle(fontSize: 24),
              )),
          ElevatedButton.icon(
            onPressed: () async {
              try {
                await auth.signInWithEmailAndPassword(
                    email: id, password: _password);
                print("Login!");
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              } on FirebaseAuthException catch (e) {
                print(e.message);
              }
            },
            icon: const Icon(Icons.login),
            label: const Text(
              "Login",
              style: TextStyle(fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
