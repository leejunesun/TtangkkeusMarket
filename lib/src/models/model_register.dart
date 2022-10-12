import 'package:flutter/material.dart';

class RegisterModel extends ChangeNotifier {
  String email = "";
  String password = "";
  String passwordConfirm = "";
  String Address = "";

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  void setPasswordConfirm(String passwordConfirm) {
    this.passwordConfirm = passwordConfirm;
    notifyListeners();
  }

  void setAddress(String Address) {
    this.Address = Address;
    notifyListeners();
  }
}
