// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Auth0Store on _Auth0StoreBase, Store {
  final _$clientAtom = Atom(name: '_Auth0StoreBase.client');

  @override
  oauth2.Client get client {
    _$clientAtom.context.enforceReadPolicy(_$clientAtom);
    _$clientAtom.reportObserved();
    return super.client;
  }

  @override
  set client(oauth2.Client value) {
    _$clientAtom.context.conditionallyRunInAction(() {
      super.client = value;
      _$clientAtom.reportChanged();
    }, _$clientAtom, name: '${_$clientAtom.name}_set');
  }

  final _$errorAtom = Atom(name: '_Auth0StoreBase.error');

  @override
  Auth0Error get error {
    _$errorAtom.context.enforceReadPolicy(_$errorAtom);
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(Auth0Error value) {
    _$errorAtom.context.conditionallyRunInAction(() {
      super.error = value;
      _$errorAtom.reportChanged();
    }, _$errorAtom, name: '${_$errorAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_Auth0StoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$setClientAsyncAction = AsyncAction('setClient');

  @override
  Future<void> setClient(dynamic username, dynamic password) {
    return _$setClientAsyncAction
        .run(() => super.setClient(username, password));
  }

  final _$getClientAsyncAction = AsyncAction('getClient');

  @override
  Future<void> getClient() {
    return _$getClientAsyncAction.run(() => super.getClient());
  }

  final _$closeClientAsyncAction = AsyncAction('closeClient');

  @override
  Future<void> closeClient(dynamic client) {
    return _$closeClientAsyncAction.run(() => super.closeClient(client));
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    final string =
        'client: ${client.toString()},error: ${error.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
