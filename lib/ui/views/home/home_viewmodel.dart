import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/models/shishakasse.dart';
import 'package:ShishaOase/models/user.dart';
import 'package:ShishaOase/services/app_service.dart';
import 'package:ShishaOase/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel {
  final AppService _appService = locator<AppService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

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

  // void _onUserUpdated(List<User> user) {
  //   userList = user;

  //   if (userList == null) {
  //     setBusy(true);
  //   } else {
  //     userList.length == 0 ? print("Ne Alter!") : print("Doch alter");
  //   }
  // }

  // getUserBalance() {
  //   var result = 0;
  //   _appService.getBalance().then((value) => result = value);
  //   return result;
  // }

  @override
  Future futureToRun() {
    return null;
  }
}
