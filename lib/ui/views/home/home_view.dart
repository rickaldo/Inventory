import 'package:ShishaOase/app/locator.dart';
import 'package:ShishaOase/models/user.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
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
          Center(
            child: Text(
              model.user == null ? "0" : model.user.balance.toString(),
            ),
          ),
        ],
      ),
      viewModelBuilder: () => locator<HomeViewModel>(),
    );
  }
}
