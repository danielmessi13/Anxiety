import 'package:flutter_anxiety/login/service/login_service.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class Login = _LoginBase with _$Login;

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
