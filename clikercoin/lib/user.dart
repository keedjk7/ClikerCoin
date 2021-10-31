import 'package:flutter/scheduler.dart';

class User {
  final String uid;

  User({required this.uid});
}

class UserData {
  late final String uid;
  final int haveCoin;
  late final int obtainCoin;
  final int begger;
  final int bussiessman;
  final int company;

  UserData(
      {required this.uid,
      required this.haveCoin,
      required this.obtainCoin,
      required this.begger,
      required this.bussiessman,
      required this.company});
}
