import 'package:ShishaOase/widgets/textform_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'addDrink_viewmodel.dart';

class AddDrinkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddDrinkViewModel>.reactive(
      builder: (
        context,
        model,
        child,
      ) =>
          Scaffold(
        appBar: AppBar(
          title: Text(
            "Was hast du schönes gekauft?",
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              model.formkey.currentState.validate() && model.getFilepath != null
                  ? model.uploadEntry()
                  : print("Du Hurensohn"),
          child: Icon(Icons.send),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Center(
              child: Form(
                key: model.formkey,
                child: Column(
                  children: [
                    formTextField(
                      "Flaschennahme",
                      false,
                      model.nameController,
                      TextInputType.text,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    formTextField(
                      "Anzahl der Flaschen",
                      false,
                      model.amountController,
                      TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    model.getImage == null
                        ? Text("No Image selected")
                        : Image.file(model.getImage),
                    RaisedButton(
                      onPressed: model.selectPictureForUpload,
                      child: Text("Select an Image"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AddDrinkViewModel(),
    );
  }
}
