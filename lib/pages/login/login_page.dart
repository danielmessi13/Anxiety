import 'package:flutter/material.dart';
import 'package:flutter_anxiety/pages/home/home_page.dart';
import 'package:flutter_anxiety/pages/signin/signin_page.dart';

import 'package:provider/provider.dart';

import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_anxiety/core/font_size/font_size.dart';
import 'package:flutter_anxiety/core/widgets/custom_text_field.dart';

import 'auth0_store.dart';
import 'login_store.dart';

Color mainBGColor = Color(0xFF652A78);
Color redColor = Color(0xFFDE3C10);
Color purpleColor = Color(0xFF8132AD);
Color cyan = Color(0xFF99D5E5);
Color orange = Color(0xFFE97A4D);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  final loginController = LoginStore();

  Auth0Store auth0Store;

  ReactionDisposer showError;

  @override
  void initState() {
    super.initState();
    auth0Store = Provider.of<Auth0Store>(context, listen: false);
    when(
      (_) => auth0Store.client != null,
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
    );
    showError = autorun((_) {
      switch (auth0Store.error) {
        case Auth0Error.invalidCredentials:
          _scaffoldKey.currentState
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text('Email ou senha invalidos'),
              backgroundColor: Colors.red,
            ));
      }
    });
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();

    emailController.dispose();
    passwordController.dispose();

    showError();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Observer(
            builder: (_) {
              return Form(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Bem vindo\nFaça o Login para continuar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: fontSize(context) * 1.2,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: emailController,
                      label: 'EMAIL',
                      error: loginController.emailError,
                      focus: null,
                      nextFocus: passwordFocus,
                      type: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      label: 'SENHA',
                      error: loginController.passwordError,
                      last: true,
                      obscure: true,
                      focus: passwordFocus,
                      nextFocus: FocusNode(),
                      type: TextInputType.visiblePassword,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.13,
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ),
                              );
                            },
                            child: Text('Criar conta'),
                          ),
                          Expanded(
                            child: Observer(builder: (_) {
                              return RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: auth0Store.loading
                                    ? null
                                    : () {
                                        if (loginController.isValid(
                                            emailController.text,
                                            passwordController.text)) {
                                          auth0Store.setClient(
                                            emailController.text.trim(),
                                            passwordController.text.trim(),
                                          );
                                        }
                                      },
                                color: Colors.blue[900],
                                textColor: Colors.white,
                                child: auth0Store.loading
                                    ? CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      )
                                    : Text(
                                        'Login'.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: fontSize(context),
                                        ),
                                      ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
