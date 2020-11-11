import 'package:ShishaOase/widgets/textform_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'login_viewmodel.dart';

class LogInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LogInViewModel>.reactive(
      builder: (
        context,
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
              child: Form(
                key: model.formkeyLog,
                child: Column(
                  children: [
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
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            if (model.formkeyLog.currentState.validate()) {
                              model.logIn();
                            }
                          },
                          child: Text("Login"),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        RaisedButton(
                          onPressed: () => model.navigateToSignUp(),
                          child: Text("Sign Up"),
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
      viewModelBuilder: () => LogInViewModel(),
    );
  }
}
