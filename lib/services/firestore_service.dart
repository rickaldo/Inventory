import 'dart:async';

import 'package:ShishaOase/models/drink.dart';
import 'package:ShishaOase/models/shishakasse.dart';
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

  Stream<Shishakasse> getShishakasse() {
    return firestore
        .collection('shishakasse')
        .doc('kasse')
        .snapshots()
        .map((event) => Shishakasse.fromData(event.data()));
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

  addTobacco(String name, int amount, String filepath) {
    CollectionReference tobacco = firestore.collection("tobacco");
    tobacco.add({
      'name': name,
      'amount': amount,
      'nearEmpty': false,
      'filepath': filepath,
      'docID': ''
    }).then((doc) {
      doc.update({'docID': doc.id});
    }).catchError((error) => "Failed to add Tobacco");
  }

  addDrink(String name, int amount, String filepath) {
    CollectionReference drink = firestore.collection("drink");
    drink.add({
      'name': name,
      'amount': amount,
      'nearEmpty': false,
      'filepath': filepath,
      'docID': ''
    }).then((doc) {
      doc.update({'docID': doc.id});
    }).catchError((error) => "Failed to add Tobacco");
  }

  deleteTobacco(String docId, int amount) {
    CollectionReference tobacco = firestore.collection("tobacco");
    if (amount == 0) {
      tobacco.doc(docId).delete();
    } else {
      tobacco.doc(docId).update({'amount': amount});
    }
  }

  deleteDrink(String docId, int amount) {
    CollectionReference drink = firestore.collection("drink");
    if (amount == 0) {
      drink.doc(docId).delete();
    } else {
      drink.doc(docId).update({'amount': amount});
    }
  }

  addAmount(int amount, int beitrag, String user) {
    CollectionReference kasse = firestore.collection('shishakasse');
    CollectionReference paid = firestore.collection('paid');

    kasse.doc("kasse").update({'amount': amount});
    paid.add({'username': user, 'amount': beitrag, 'date': DateTime.now()});
  }
}
