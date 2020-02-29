import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'pages/login/auth0_store.dart';
import 'pages/login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Auth0Store(),
      child: MaterialApp(
        title: 'Anxiety',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.lightBlue,
          primaryColor: Colors.lightBlue,
          textTheme: GoogleFonts.pTMonoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: LoginPage(),
      ),
    );
  }
}
