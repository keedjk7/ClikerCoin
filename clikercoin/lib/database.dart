// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  List brewsList = [];

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String nameInGame, int obtainedCoin, int haveCoin,
      int begger, int bussiessman, int company) async {
    return await brewCollection.doc(uid).set({
      'nameInGame': nameInGame,
      'obtainCoin': obtainedCoin,
      'haveCoin': haveCoin,
      'begger': begger,
      'bussiessman': bussiessman,
      'company': company,
    });
  }

  Future getData() async {
    try {
      await brewCollection.get().then((QuerySnapshot) {
        for (var result in QuerySnapshot.docs) {
          brewsList.add(result.data());
        }
      });

      return brewsList;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }
}
