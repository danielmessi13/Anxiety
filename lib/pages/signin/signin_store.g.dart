// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInStore on _SignInStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_SignInStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$emailErrorAtom = Atom(name: '_SignInStoreBase.emailError');

  @override
  String get emailError {
    _$emailErrorAtom.context.enforceReadPolicy(_$emailErrorAtom);
    _$emailErrorAtom.reportObserved();
    return super.emailError;
  }

  @override
  set emailError(String value) {
    _$emailErrorAtom.context.conditionallyRunInAction(() {
      super.emailError = value;
      _$emailErrorAtom.reportChanged();
    }, _$emailErrorAtom, name: '${_$emailErrorAtom.name}_set');
  }

  final _$passwordErrorAtom = Atom(name: '_SignInStoreBase.passwordError');

  @override
  String get passwordError {
    _$passwordErrorAtom.context.enforceReadPolicy(_$passwordErrorAtom);
    _$passwordErrorAtom.reportObserved();
    return super.passwordError;
  }

  @override
  set passwordError(String value) {
    _$passwordErrorAtom.context.conditionallyRunInAction(() {
      super.passwordError = value;
      _$passwordErrorAtom.reportChanged();
    }, _$passwordErrorAtom, name: '${_$passwordErrorAtom.name}_set');
  }

  final _$passwordConfirmationErrorAtom =
      Atom(name: '_SignInStoreBase.passwordConfirmationError');

  @override
  String get passwordConfirmationError {
    _$passwordConfirmationErrorAtom.context
        .enforceReadPolicy(_$passwordConfirmationErrorAtom);
    _$passwordConfirmationErrorAtom.reportObserved();
    return super.passwordConfirmationError;
  }

  @override
  set passwordConfirmationError(String value) {
    _$passwordConfirmationErrorAtom.context.conditionallyRunInAction(() {
      super.passwordConfirmationError = value;
      _$passwordConfirmationErrorAtom.reportChanged();
    }, _$passwordConfirmationErrorAtom,
        name: '${_$passwordConfirmationErrorAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},emailError: ${emailError.toString()},passwordError: ${passwordError.toString()},passwordConfirmationError: ${passwordConfirmationError.toString()}';
    return '{$string}';
  }
}
