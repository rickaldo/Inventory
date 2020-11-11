import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final int balance;
  final String username;

  User({this.email, this.balance, this.username});

  User.fromData(Map<String, dynamic> data)
      : email = data['email'] ?? '',
        balance = data['balance'] ?? 0,
        username = data['username'] ?? '';

  String get getUserName => this.username;
  String get getEMail => this.email;
  int get getBalance => this.balance;
}
