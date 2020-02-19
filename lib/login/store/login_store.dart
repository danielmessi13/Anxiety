import 'package:flutter_anxiety/login/service/login_service.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class Login = _LoginBase with _$Login;

abstract class _LoginBase with Store {
  final loginService = LoginService();

  @observable
  bool isLoading = false;

  @observable
  String nameError;

  @observable
  String emailError;

  @observable
  String passwordError;

  @action
  Future<void> login(String email, String name, String password) async {
    isLoading = true;

    if (isValid(email, name, password)) {
      final result = await loginService.login(email, name, password);
    }

    isLoading = false;
  }

  bool isValid(String email, String name, String password) {
    emailError = null;
    nameError = null;
    passwordError = null;

    if (email.trim().isEmpty) {
      emailError = "Email inválido";
    }

    if (name.trim().isEmpty) {
      nameError = "Nome inválido";
    }

    if (password.trim().isEmpty) {
      passwordError = "Senha inválida";
    }

    // if (!email.contains("@gmail.com") ||
    //     !email.contains("@hotmail.com") ||
    //     !email.contains("@outlook.com")) {
    //   emailError = "Email inválido";
    // }
    
    return passwordError == null && nameError == null && emailError == null
        ? true
        : false;
  }
}
