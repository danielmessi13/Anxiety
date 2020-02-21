import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

part 'auth0_store.g.dart';

class Auth0Store = _Auth0StoreBase with _$Auth0Store;

final _secureStorage = FlutterSecureStorage();
final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 80,
    colors: false,
    printEmojis: true,
    printTime: false,
  ),
);

abstract class _Auth0StoreBase with Store {
  final _authEndpoint = Uri.parse('https://dev-pa7un662.auth0.com/oauth/token');
  static const _clientId = 'gg64KJZy2G6xmO5b7zlysEZvA6WiJI1f';
  static const _clientSecret =
      'Cj3Xacflf1pPNXQhQjffCfKq4gGYtoUgMBJLiC2T0774uJ7OooCL2jVbQ8MXUc9B';

  @observable
  oauth2.Client client;

  @observable
  Auth0Error error;

  @observable
  bool loading = true;

  _Auth0StoreBase() {
    _logger.i('Auth0Store Started');
    getClient();
  }

  @action
  Future<void> setClient(username, password) async {
    loading = true;
    try {
      var client = await oauth2.resourceOwnerPasswordGrant(
        _authEndpoint,
        username,
        password,
        scopes: ['openid'],
        identifier: _clientId,
        secret: _clientSecret,
      );

      await _persistToken(jsonEncode(client.credentials.toJson()));
      await getClient();
    } on FormatException catch (_) {
      _logger.e('Invalid email or password');
      error = Auth0Error.invalidCredentials;
    }
    loading = false;
  }

  @action
  Future<void> getClient() async {
    loading = true;
    String token = await _getToken();

    if (token.isNotEmpty) {
      this.client = oauth2.Client(
        oauth2.Credentials.fromJson(jsonDecode(token)),
      );
    }
    loading = false;
  }

  @action
  Future<void> closeClient(client) async {
    await _persistToken(jsonEncode(client.credentials.toJson()));
    client.close();
    client = null;
    _logger.i('Client closed');
  }

  @action
  Future<void> logout() async {
    await _secureStorage.delete(key: 'token');
    client = null;
    _logger.i('Token deleted');
  }

  Future<void> _persistToken(String token) async {
    await _secureStorage.write(key: 'token', value: token).then(
          (_) => _logger.i('Token saved'),
        );
  }

  Future<String> _getToken() async {
    var token = await _secureStorage.read(key: 'token');
    _logger.i(token != null ? 'Token found' : 'No token found');
    return token ?? '';
  }
}

enum Auth0Error {
  invalidCredentials,
}
