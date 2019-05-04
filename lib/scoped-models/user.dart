import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';

mixin UserModel on Model {
  User _authenticatedUser;

  User get authUser {
    return _authenticatedUser;
  }

  void login(String email, String password) {
    _authenticatedUser = User(id: '1', email: email, password: password);
  }
}