import 'package:ShishaOase/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'drink_viewmodel.dart';

class DrinkView extends StatelessWidget {
  const DrinkView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrinkViewModel>.reactive(
      disposeViewModel: false,
      // Inidicate that we only want to initialise a specialty viewmodel once
      initialiseSpecialViewModelsOnce: true,
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Center(
        child: Text(
          model.getDrink.isEmpty
              ? "Kauf Getränke du Mongo"
              : model.getDrink.first.name,
        ),
      ),

      viewModelBuilder: () => locator<DrinkViewModel>(),
    );
  }
}
