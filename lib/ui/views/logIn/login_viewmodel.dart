import 'package:ShishaOase/app/constants.dart';
import 'package:ShishaOase/services/authentication_service.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/locator.dart';
import '../../../services/navigation_service.dart';

class LogInViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final formkeyLog = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  void logIn() async {
    var result = await _authenticationService.logUserIn(
        mailController.text, passwordController.text);
    if (result is bool) {
      if (result) {
        _navigationService.navigateToReplacedNamed(mainView);
      } else {
        print("Login failed");
      }
    } else {
      print("Something else");
    }
  }

  void navigateToSignUp() {
    _navigationService.navigateToNamed(signInView);
  }
}
