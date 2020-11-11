import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/models/user.dart';
import 'package:ShishaOase/services/authentication_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

import 'firestore_service.dart';

class AppService with ReactiveServiceMixin {
  final FirestoreService _fireStoreService = locator<FirestoreService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  List<User> _userList = List();
  List<User> get getUser => _userList;

  Future<AppService> initStream() async {
    locator<FirestoreService>()
        .activateChangeListener(locator<AuthenticationService>().getUsersMail())
        .listen((user) {
      _userList.clear();
      _userList.addAll(user);
      notifyListeners();
    });
    await Future.delayed(Duration(seconds: 1));
    return this;
  }

  initFirestore() {
    if (_authenticationService.isUserLoggedIn()) {
      _fireStoreService
          .activateChangeListener(_authenticationService.getUsersMail());
    }
  }
}
