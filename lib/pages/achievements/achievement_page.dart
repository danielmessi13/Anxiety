import 'package:flutter/material.dart';
import 'package:intl/number_symbols.dart';


class AchievementPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Conquistas',
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: MediaQuery.of(context).size.width * 0.3,
          ),
        ]
      )
    );
  }
}