import 'package:ShishaOase/app/constants.dart';
import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/models/drink.dart';
import 'package:ShishaOase/services/app_service.dart';
import 'package:ShishaOase/services/authentication_service.dart';
import 'package:ShishaOase/services/firestore_service.dart';
import 'package:ShishaOase/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class DrinkViewModel extends FutureViewModel {
  final AppService _appService = locator<AppService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

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

  void updateDrink(Drink drink, int amount) {
    _firestoreService.deleteDrink(
      drink.getDocId,
      drink.getAmount + amount,
    );
  }

  navigateToAddDrinkView() {
    _navigationService.navigateToNamed(addDrinkView);
  }

  @override
  Future<List> futureToRun() {
    return null;
  }
}
