// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Login on _LoginBase, Store {
  final _$isLoadingAtom = Atom(name: '_LoginBase.isLoading');

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

  final _$emailErrorAtom = Atom(name: '_LoginBase.emailError');

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

  final _$passwordErrorAtom = Atom(name: '_LoginBase.passwordError');

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

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},emailError: ${emailError.toString()},passwordError: ${passwordError.toString()}';
    return '{$string}';
  }
}
