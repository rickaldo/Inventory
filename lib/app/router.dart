import 'package:ShishaOase/ui/views/addDrink/addDrink_view.dart';
import 'package:ShishaOase/ui/views/addTabacoo/addTabacco_view.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

import '../ui/views/login/login_view.dart';
import '../ui/views/signIn/signin_view.dart';
import '../ui/views/main/main_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case logInView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LogInView(),
      );
    case signInView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignInView(),
      );
    case mainView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MainView(),
      );
    case addTobaccoView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: AddTabaccoView(),
      );
    case addDrinkView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: AddDrinkView(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
