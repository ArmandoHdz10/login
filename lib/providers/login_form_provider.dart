import 'package:flutter/material.dart';

class LoginForm extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  String Mail = '';
  String pass = '';
  bool _isloading = false;
  bool get isloading => _isloading;

  set isloading(bool value){
    _isloading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
