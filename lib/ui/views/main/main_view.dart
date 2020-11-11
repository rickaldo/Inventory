import 'package:ShishaOase/ui/views/drinklist/drink_view.dart';
import 'package:ShishaOase/ui/views/home/home_view.dart';
import 'package:ShishaOase/ui/views/main/main_viewmodel.dart';
import 'package:ShishaOase/ui/views/tabakliste/tabak_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (
        context,
        model,
        child,
      ) =>
          Scaffold(
        appBar: AppBar(
          title: Text(
            "Welcome to ShishaOase",
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(15),
              child: RaisedButton(
                onPressed: () => model.logOut(),
                child: Text(
                  "LogOut",
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.storage),
              label: "Tabakvorrat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_drink),
              label: "Getränke",
            ),
          ],
        ),
        body: getViewForIndex(model.currentIndex),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return TabakView();
      case 1:
        return HomeView();
      case 2:
        return DrinkView();
      default:
        return HomeView();
    }
  }
}
