import 'package:mobx/mobx.dart';

import 'package:flutter_anxiety/pages/login/service/login_service.dart';

part 'login_store.g.dart';

class LoginStore = _LoginBase with _$LoginStore;

abstract class _LoginBase with Store {
  final loginService = LoginService();

  @observable
  bool isLoading = false;

  @observable
  String emailError;

  @observable
  String passwordError;

  bool isValid(String email, String password) {
    emailError = null;
    passwordError = null;

    if (email.trim().isEmpty) {
      emailError = "Email inválido";
    }

    if (password.trim().isEmpty) {
      passwordError = "Senha inválida";
    }

    return passwordError == null && emailError == null ? true : false;
  }
}
