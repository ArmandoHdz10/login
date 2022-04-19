import 'package:flutter/material.dart';

class InputsUi {
  static InputDecoration authInputsUi(
      {required String hintText, required String labelText, IconData? prefix}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow,
            width: 3,
          ),
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: prefix != null ? Icon(prefix, color: Colors.red) : null);
  }
}
