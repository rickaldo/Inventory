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
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.navigateToAddDrinkView(),
          child: Icon(Icons.add),
        ),
        body: GridView.builder(
          itemCount: model.getDrink.length,
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
                      onPressed: () => model.updateDrink(
                        model.getDrink[index],
                        model.getDrink[index].getAmount * -1,
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Image.network(model.getDrink[index].getUrl),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_upward),
                            onPressed: () => model.updateDrink(
                              model.getDrink[index],
                              1,
                            ),
                            color: Colors.lime,
                          ),
                          Column(
                            children: [
                              Text(
                                model.getDrink[index].name.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2),
                              ),
                              Text(
                                "Flaschen: " +
                                    model.getDrink[index].amount.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_downward),
                            onPressed: () => model.updateDrink(
                              model.getDrink[index],
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

      viewModelBuilder: () => locator<DrinkViewModel>(),
    );
  }
}
