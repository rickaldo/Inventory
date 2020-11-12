import 'dart:io';

import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/models/drink.dart';
import 'package:ShishaOase/models/tobacco.dart';
import 'package:ShishaOase/models/user.dart';
import 'package:ShishaOase/services/authentication_service.dart';

import 'package:ShishaOase/services/firestorage_service.dart';
import 'package:stacked/stacked.dart';

import 'firestore_service.dart';

class AppService with ReactiveServiceMixin {
  final FirestoreService _fireStoreService = locator<FirestoreService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final FireStorageService _fireStorageService = locator<FireStorageService>();

  List<User> _userList = List();
  List<User> get getUser => _userList;

  List<Tobacco> _tobaccoList = List();
  List<Tobacco> get getTobaccoList => _tobaccoList;

  List<Drink> _drinkList = List();
  List<Drink> get getDrinkList => _drinkList;

  Future<AppService> initStream() async {
    _fireStoreService
        .activateChangeListener(_authenticationService.getUsersMail())
        .listen((user) {
      _userList.clear();
      _userList.addAll(user);
      notifyListeners();
    });

    _fireStoreService.getTobaccoList().listen((tobacco) {
      _tobaccoList.clear();
      _tobaccoList.addAll(tobacco);
      notifyListeners();
    });

    _fireStoreService.getDrinkList().listen((drink) {
      _drinkList.clear();
      _drinkList.addAll(drink);
      notifyListeners();
    });

    await Future.delayed(Duration(seconds: 2));
    return this;
  }

  initFirestore() {
    if (_authenticationService.isUserLoggedIn()) {
      _fireStoreService
          .activateChangeListener(_authenticationService.getUsersMail());
    }
  }

  uploadNewTabacco(String name, int amount, String filepath) async {
    String downloadLink = await _fireStorageService.uploadPicture(filepath);
    _fireStoreService.addTobacco(name, amount, downloadLink);
  }

  uploadNewDrink(String name, int amount, String filepath) async {
    String downloadLink = await _fireStorageService.uploadPicture(filepath);
    _fireStoreService.addDrink(name, amount, downloadLink);
  }
}
