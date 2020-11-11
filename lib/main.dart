import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/services/app_service.dart';
import 'package:ShishaOase/services/authentication_service.dart';
import 'package:ShishaOase/services/navigation_service.dart';
import 'package:ShishaOase/ui/views/home/home_view.dart';
import 'package:ShishaOase/ui/views/home/home_viewmodel.dart';
import 'package:ShishaOase/ui/views/logIn/login_view.dart';
import 'package:ShishaOase/ui/views/main/main_view.dart';
import 'package:ShishaOase/ui/views/signIn/signin_view.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'app/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
      home: FutureBuilder(
        future: locator.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (locator<AuthenticationService>().isUserLoggedIn()) {
              return MainView();
            } else {
              return SignInView();
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  // Widget showScreen() {
  //   var loggedIn = locator<AuthenticationService>().isUserLoggedIn();
  //   if (loggedIn) {
  //     return MainView();
  //   } else {
  //     return LogInView();
  //   }
  // }
}
