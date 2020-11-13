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
          SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                width: double.infinity,
                child: Card(
                  child: Column(
                    children: [
                      FittedBox(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            "Shalom Shalom " + model.user.getUserName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      FittedBox(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            "In der Kasse befinden sich: \n" +
                                model.kasse.amount.toString() +
                                "€",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                height: 200,
                child: Card(
                  child: GridTile(
                    header: FittedBox(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "Auf Kusch Kusch Basis hier Einzahlung eintragen",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(1),
                        ),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF64ffda),
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(
                              17,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () => model.showAlterDialog(
                              context,
                              5,
                            ),
                            child: Text(
                              "+5€",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF64ffda),
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(
                              17,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () => model.showAlterDialog(
                              context,
                              10,
                            ),
                            child: Text(
                              "+10€",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 66,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF64ffda),
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(
                              17,
                            ),
                          ),
                          child: TextField(
                            controller: model.ownAmount,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "and. Betrag",
                              hintStyle: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                            onSubmitted: (value) => value.length == 0
                                ? null
                                : model.showAlterDialog(
                                    context,
                                    int.parse(value),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "assets/img/startimage.jpeg",
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => locator<HomeViewModel>(),
    );
  }
}
