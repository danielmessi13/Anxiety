import 'package:flutter/material.dart';
import 'package:flutter_anxiety/pages/login/store/auth0_store.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'pages/login/presentation/page/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Auth0Store(),
      child: MaterialApp(
        title: 'Anxiety',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueGrey,
          primaryColor: Colors.blueGrey[500],
          textTheme: GoogleFonts.pTMonoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: LoginPage(),
      ),
    );
  }
}
