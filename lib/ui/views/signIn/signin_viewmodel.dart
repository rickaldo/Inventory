import 'package:ShishaOase/app/constants.dart';
import 'package:ShishaOase/services/authentication_service.dart';
import 'package:ShishaOase/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../services/navigation_service.dart' as nav;

class SignInViewModel extends BaseViewModel {
  final nav.NavigationService _navigationService =
      locator<nav.NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final SnackbarService _snackBar = locator<SnackbarService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final confrimPasswordController = TextEditingController();

  Future createUser() async {
    setBusy(true);
    if (passwordController.text.trim() ==
        confrimPasswordController.text.trim()) {
      var result = await _authenticationService.registerUser(
        mailController.text,
        passwordController.text,
      );
      setBusy(false);
      if (result is bool) {
        if (result) {
          await _firestoreService.addUser(
            nameController.text,
            mailController.text,
            0,
          );
          _navigationService.navigateToReplacedNamed(mainView);
        } else {
          print("Dang GUUUURL");
        }
      }
    } else {
      print("SignUp was a Failure");
    }
  }

  void navigateToLogIn() {
    _navigationService.navigateToNamed(logInView);
  }

  void showSnackBar() {
    _snackBar.showSnackbar(message: "Bro gib Bitte die Felder ein");
  }
}
