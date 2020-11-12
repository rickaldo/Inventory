import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/models/drink.dart';
import 'package:ShishaOase/services/app_service.dart';
import 'package:ShishaOase/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class DrinkViewModel extends FutureViewModel {
  final AppService _appService = locator<AppService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  List<Drink> _drink;
  List<Drink> get getDrink => _drink;

  DrinkViewModel() {
    _appService.addListener(init);
  }

  void init() {
    setBusy(true);
    if (_authenticationService.isUserLoggedIn()) {
      _drink = _appService.getDrinkList;
    }
    notifyListeners();
    setBusy(false);
  }

  @override
  Future<List> futureToRun() {
    return null;
  }
}
