import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void showAchievement(BuildContext context,String title, String subtitle){
  AchievementView(
    context,
    title: title,
    icon: Icon(FontAwesomeIcons.trophy,color: Colors.amber,),
    subTitle: subtitle,
    isCircle: true,
    color: Colors.green,
    listener: (status){
      print(status);
    }
  ).show();
}