import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../../../widgets/textform_widget.dart';

import 'signin_viewmodel.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      builder: (
        ctx,
        model,
        child,
      ) =>
          Scaffold(
        appBar: AppBar(
          title: Text(
            "Welcome to ShishaOase",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Center(
              child: SizedBox(
                width: 400,
                height: 400,
                child: Form(
                  key: model.formkey,
                  child: Column(
                    children: [
                      formTextField(
                        "Displayname",
                        false,
                        model.nameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      formTextField(
                        "E-Mail",
                        false,
                        model.mailController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      formTextField(
                        "Password",
                        true,
                        model.passwordController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      formTextField(
                        "Confirm Password",
                        true,
                        model.confrimPasswordController,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            onPressed: () =>
                                model.formkey.currentState.validate()
                                    ? model.createUser()
                                    : model.showSnackBar(),
                            child: Text("Sign Up"),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          RaisedButton(
                            onPressed: () => model.navigateToLogIn(),
                            child: Text("Back to LogIn"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SignInViewModel(),
    );
  }
}
