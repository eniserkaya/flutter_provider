import 'package:flutter/foundation.dart';
import 'package:flutter_provider/models/user.dart';

class UserModel extends ChangeNotifier {
  User user = User.defaultValue();

  void login(User user) {
    this.user = user;
    notifyListeners();
  }

  bool logOut() {
    this.user = User.defaultValue();
    notifyListeners();
    return true;
  }
}
