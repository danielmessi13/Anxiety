import 'package:mobx/mobx.dart';

part 'signin_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  String emailError;

  @observable
  String passwordError;

  @observable
  String passwordConfirmationError;

  bool isValid(String email, String password, String passwordConfirmation) {
    emailError = null;
    passwordError = null;
    passwordConfirmationError = null;

    if (email.trim().isEmpty) {
      emailError = "Email inválido";
    }

    if (password.trim().isEmpty) {
      passwordError = "Senha inválida";
    }

    if (passwordConfirmation.trim().isEmpty) {
      passwordConfirmationError = "Confirme a senha";
    }

    if (password.trim() != passwordConfirmation.trim()) {
      passwordConfirmationError = "As senhas não são iguais";
    }

    return passwordError == null &&
            emailError == null &&
            passwordConfirmationError == null
        ? true
        : false;
  }
}
