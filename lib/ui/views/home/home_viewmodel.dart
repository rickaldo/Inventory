import 'package:ShishaOase/app/constants.dart';
import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/models/shishakasse.dart';
import 'package:ShishaOase/models/user.dart';
import 'package:ShishaOase/services/app_service.dart';
import 'package:ShishaOase/services/authentication_service.dart';
import 'package:ShishaOase/services/firestore_service.dart';
import 'package:ShishaOase/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel {
  final AppService _appService = locator<AppService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final ownAmount = TextEditingController();

  User _user;
  User get user => _user;

  Shishakasse _kasse;
  Shishakasse get kasse => _kasse;

  HomeViewModel() {
    _appService.addListener(init);
  }

  void init() {
    setBusy(true);
    if (_authenticationService.isUserLoggedIn()) {
      _user = _appService.getUser[0];
      _kasse = _appService.getShishaKasse[0];
    }
    notifyListeners();
    setBusy(false);
  }

  showAlterDialog(BuildContext context, int amount) {
    Widget cancelButton = FlatButton(
      onPressed: () => _navigationService.popBack(),
      child: Text("Nein"),
    );
    Widget continueButton = FlatButton(
        onPressed: () async => {
              await _firestoreService.addAmount(
                _kasse.amount + amount,
                amount,
                _user.getUserName,
              ),
              _navigationService.popBack(),
            },
        child: Text("Ja"));

    AlertDialog alert = AlertDialog(
      title: Text("Amena Warte"),
      content: Text("Willste wirklich $amount€ einzahlen?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }

  @override
  Future futureToRun() {
    return null;
  }
}
