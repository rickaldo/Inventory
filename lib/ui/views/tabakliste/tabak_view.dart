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
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.navigteToAddTobaccoView(),
          child: Icon(Icons.add),
        ),
        body: GridView.builder(
          itemCount: model.getTobacco.length,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(5),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  (MediaQuery.of(context).orientation == Orientation.portrait)
                      ? 2
                      : 3),
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: GridTile(
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      alignment: Alignment.topRight,
                      icon: Icon(Icons.delete),
                      onPressed: () => model.updateTabacco(
                        model.getTobacco[index],
                        model.getTobacco[index].getAmount * -1,
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Image.network(model.getTobacco[index].getUrl),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_upward),
                            onPressed: () => model.updateTabacco(
                              model.getTobacco[index],
                              1,
                            ),
                            color: Colors.lime,
                          ),
                          Column(
                            children: [
                              Text(
                                model.getTobacco[index].name.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2),
                              ),
                              Text(
                                "Dosen: " +
                                    model.getTobacco[index].amount.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_downward),
                            onPressed: () => model.updateTabacco(
                              model.getTobacco[index],
                              -1,
                            ),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      viewModelBuilder: () => locator<TabakViewModel>(),
    );
  }
}
