import 'package:ShishaOase/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tabak_viewmodel.dart';

class TabakView extends StatelessWidget {
  const TabakView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TabakViewModel>.reactive(
      disposeViewModel: false,
      // Inidicate that we only want to initialise a specialty viewmodel once
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Center(
        child: Text(
          "Tabakliste",
        ),
      ),
      viewModelBuilder: () => locator<TabakViewModel>(),
    );
  }
}
