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
