import 'dart:async';

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

  // final StreamController<List<User>> _userController =
  //     StreamController<List<User>>();

  // Stream<List<User>> get user => _userController.stream;

  // void _userAdded(QuerySnapshot snapShot) {
  //   var user = _getUserFromSnapshot(snapShot);
  //   _userController.add(user);
  // }

  // List<User> _getUserFromSnapshot(QuerySnapshot snapShot) {
  //   var userItems = List<User>();
  //   var documents = snapShot.docs;
  //   var hasDocuments = documents.length > 0;

  //   if (hasDocuments) {
  //     for (var document in documents) {
  //       userItems.add(User.fromData(document.data()));
  //     }
  //   }

  //   return userItems;
  // }

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
