import 'package:flutter/material.dart';

import 'home/presentation/page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anxiety',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        primaryColor: Colors.blueGrey[500],
      ),
      home: HomePage(),
    );
  }
}
