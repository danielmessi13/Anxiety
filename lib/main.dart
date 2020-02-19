import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login/presentation/page/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anxiety',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        primaryColor: Colors.blueGrey[500],
        textTheme: GoogleFonts.pTMonoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LoginPage(),
    );
  }
}
