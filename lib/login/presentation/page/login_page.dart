import 'package:flutter/material.dart';
import 'package:flutter_anxiety/login/store/auth0_store.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_anxiety/core/font_size/font_size.dart';
import 'package:flutter_anxiety/core/widgets/custom_text_field.dart';
import 'package:flutter_anxiety/login/store/login_store.dart';

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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  final loginController = Login();

  final auth0Store = Auth0Store();

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Observer(builder: (_) {
              return loginController.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
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
                          focus: emailFocus,
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
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () => auth0Store.setClient(
                                  emailController.text,
                                  passwordController.text,
                                ),
                                color: Colors.blue[900],
                                textColor: Colors.white,
                                child: Text(
                                  'Login'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: fontSize(context),
                                  ),
                                ),
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () => auth0Store.logout(),
                                color: Colors.red[900],
                                textColor: Colors.white,
                                child: Text(
                                  'Logout'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: fontSize(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            }),
          ),
        ),
      ),
    );
  }
}
