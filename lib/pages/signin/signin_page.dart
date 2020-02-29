import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anxiety/core/font_size/font_size.dart';
import 'package:flutter_anxiety/core/widgets/custom_text_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'signin_store.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final passwordConfirmationFocus = FocusNode();

  final signInController = SignInStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Form(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Crie sua conta',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSize(context) * 1.2,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return Column(
                      children: <Widget>[
                        CustomTextField(
                          controller: emailController,
                          label: 'EMAIL',
                          error: signInController.emailError,
                          focus: null,
                          nextFocus: passwordFocus,
                          type: TextInputType.emailAddress,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          label: 'SENHA',
                          error: signInController.passwordError,
                          last: true,
                          obscure: true,
                          focus: passwordFocus,
                          nextFocus: passwordConfirmationFocus,
                          type: TextInputType.visiblePassword,
                        ),
                        CustomTextField(
                          controller: passwordConfirmationController,
                          label: 'CONFIRME A SENHA',
                          error: signInController.passwordConfirmationError,
                          last: true,
                          obscure: true,
                          focus: passwordConfirmationFocus,
                          nextFocus: FocusNode(),
                          type: TextInputType.visiblePassword,
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.13,
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar'),
                      ),
                      Expanded(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () async {
                            if (signInController.isValid(
                              emailController.text,
                              passwordController.text,
                              passwordConfirmationController.text,
                            )) {
                              try {
                                await Dio().post(
                                  'https://dev-pa7un662.auth0.com/dbconnections/signup',
                                  data: {
                                    'email': emailController.text,
                                    'password': passwordController.text,
                                    'client_id':
                                        'gg64KJZy2G6xmO5b7zlysEZvA6WiJI1f',
                                    'connection':
                                        'Username-Password-Authentication'
                                  },
                                );
                                Navigator.pop(context);
                              } on DioError catch (e) {
                                if (e.response.statusCode == 400) {
                                  String error = e.response.data['code'] ??
                                      e.response.data['error'];
                                  print(error);
                                  if (error.contains('invalid_signup')) {
                                    showSnackBarError('Email já cadastrado');
                                  } else if (error.contains('error in email')) {
                                    showSnackBarError('Email inválido');
                                  } else if (error
                                      .contains('invalid_password')) {
                                    showSnackBarError('Senha inválida');
                                  } else {
                                    showSnackBarError('Erro desconhecido');
                                  }
                                }
                              }
                            }
                          },
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          child: Text(
                            'Finalizar'.toUpperCase(),
                            style: TextStyle(
                              fontSize: fontSize(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBarError(String text) {
    _scaffoldKey.currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
          backgroundColor: Colors.red,
        ),
      );
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();

    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
