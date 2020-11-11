import 'package:ShishaOase/app/constants.dart';
import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/services/authentication_service.dart';
import 'package:ShishaOase/services/navigation_service.dart' as nav;
import 'package:stacked/stacked.dart';

class MainViewModel extends IndexTrackingViewModel {
  int currentIndex = 1;
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  nav.NavigationService _navigationService = locator<nav.NavigationService>();

  Future<void> logOut() async {
    await _authenticationService.logOut();
    _navigationService.navigateToReplacedNamed(logInView);
  }
}
