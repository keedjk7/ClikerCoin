// ignore_for_file: non_constant_identifier_names

import 'package:clikercoin/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clikercoin/brew.dart';
import 'user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //List brewsList = [];

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

  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
          nameInGame: doc['nameInGame'] ?? '',
          haveCoin: doc['haveCoin'] ?? 0,
          obtainCoin: doc['obtainCoin'] ?? 0,
          begger: doc['begger'] ?? 0,
          bussiessman: doc['bussiessman'] ?? 0,
          company: doc['company'] ?? 0);
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        haveCoin: snapshot['haveCoin'],
        obtainCoin: snapshot['obtainCoin'],
        begger: snapshot['begger'],
        bussiessman: snapshot['bussiessman'],
        company: snapshot['company']);
  }

  //get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
