import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/services/authentication_service.dart';
import 'package:ShishaOase/services/navigation_service.dart';

import 'package:ShishaOase/ui/views/main/main_view.dart';
import 'package:ShishaOase/ui/views/signIn/signin_view.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
        buttonTheme: ButtonThemeData(
          buttonColor: const Color(0xFF64ffda),
          textTheme: ButtonTextTheme.primary,
        ),
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF212121),
        accentColor: const Color(0xFF64ffda),
        canvasColor: const Color(0xFF303030),
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
}
