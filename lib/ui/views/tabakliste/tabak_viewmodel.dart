import 'package:ShishaOase/app/constants.dart';
import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/models/tobacco.dart';
import 'package:ShishaOase/services/app_service.dart';
import 'package:ShishaOase/services/authentication_service.dart';
import 'package:ShishaOase/services/firestore_service.dart';
import 'package:ShishaOase/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class TabakViewModel extends FutureViewModel {
  final AppService _appService = locator<AppService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  List<Tobacco> _tobacco;
  List<Tobacco> get getTobacco => _tobacco;

  TabakViewModel() {
    _appService.addListener(init);
  }

  void init() {
    setBusy(true);
    if (_authenticationService.isUserLoggedIn()) {
      _tobacco = _appService.getTobaccoList;
    }
    notifyListeners();
    setBusy(false);
  }

  void updateTabacco(Tobacco tobacco, int amount) {
    _firestoreService.deleteTobacco(
      tobacco.getDocId,
      tobacco.getAmount + amount,
    );
  }

  navigteToAddTobaccoView() {
    _navigationService.navigateToNamed(addTobaccoView);
  }

  @override
  Future<List> futureToRun() {
    return null;
  }
}
