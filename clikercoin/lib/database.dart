import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

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
}
