import 'package:flutter/material.dart';
import 'package:flutter_provider/models/user.dart';

class UserModel extends ChangeNotifier {
  User _user;

  increaseSalary(int amount) {
    _user.salary = _user.salary + amount;
    notifyListeners();
  }

  decreaseSalary(int amount) {
    _user.salary = _user.salary - amount;
    notifyListeners();
  }

  setUser(User user){
      _user = user;
      notifyListeners();
  }
}
