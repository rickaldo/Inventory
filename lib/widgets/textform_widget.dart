import 'package:flutter/material.dart';

Widget formTextField(String fieldname, bool obscure,
    TextEditingController controller, TextInputType type) {
  return TextFormField(
    keyboardType: type,
    obscureText: obscure,
    decoration: InputDecoration(
      hintText: fieldname,
    ),
    controller: controller,
    validator: (value) {
      if (value.isEmpty) {
        return "Das Feld $fieldname steht nicht aus Spaß da. AMENA";
      }
      return null;
    },
  );
}
