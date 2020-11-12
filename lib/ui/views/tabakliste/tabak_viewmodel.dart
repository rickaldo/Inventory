import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/models/tobacco.dart';
import 'package:ShishaOase/services/app_service.dart';
import 'package:stacked/stacked.dart';

class TabakViewModel extends FutureViewModel {
  final AppService _appService = locator<AppService>();

  List<Tobacco> _tobacco;
  List<Tobacco> get getTobacco => _tobacco;

  TabakViewModel() {
    _appService.addListener(init);
  }

  void init() {
    setBusy(true);
    _tobacco = _appService.getTobaccoList;
    notifyListeners();
    setBusy(false);
  }

  @override
  Future<List> futureToRun() {
    return null;
  }
}
