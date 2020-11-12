import 'dart:async';

import 'package:ShishaOase/models/drink.dart';
import 'package:ShishaOase/models/tobacco.dart';
import 'package:ShishaOase/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<User>> activateChangeListener(String email) {
    return firestore
        .collection("users")
        .where(
          "email",
          isEqualTo: email,
        )
        .snapshots()
        .map((snapShot) =>
            snapShot.docs.map((doc) => User.fromData(doc.data())).toList());
  }

  Stream<List<Tobacco>> getTobaccoList() {
    return firestore.collection("tobacco").snapshots().map((snapShot) =>
        snapShot.docs.map((doc) => Tobacco.fromData(doc.data())).toList());
  }

  Stream<List<Drink>> getDrinkList() {
    return firestore.collection("drink").snapshots().map((snapShot) =>
        snapShot.docs.map((doc) => Drink.fromData(doc.data())).toList());
  }

  addUser(String username, String email, double balance) {
    CollectionReference users = firestore.collection('users');
    users
        .add({
          'username': username,
          'email': email,
          'balance': balance,
        })
        .then((value) => print("User Added"))
        .catchError((error) => "Failed to add User");
  }
}
