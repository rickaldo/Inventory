import 'package:ShishaOase/widgets/textform_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'addTabacco_viewmodel.dart';

class AddTabaccoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTabaccoViewModel>.reactive(
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
                      "Tabakname",
                      false,
                      model.nameController,
                      TextInputType.text,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    formTextField(
                      "Anzahl der Dosen",
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
      viewModelBuilder: () => AddTabaccoViewModel(),
    );
  }
}
