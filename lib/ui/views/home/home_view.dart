import 'package:ShishaOase/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  //TODO: Shishakassegeld erhögen, amount und user loggen
//TODO: Generelle Ansicht der Homeview Überdenken

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      onModelReady: (model) => model.init(),
      // Inidicate that we only want to initialise a specialty viewmodel once
      initialiseSpecialViewModelsOnce: true,
      builder: (
        context,
        model,
        child,
      ) =>
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Shalom Shalom"),
          Center(
            child: Text(
              "In der Kasse befinden sich: " +
                  model.kasse.amount.toString() +
                  "€",
            ),
          ),
        ],
      ),
      viewModelBuilder: () => locator<HomeViewModel>(),
    );
  }
}
