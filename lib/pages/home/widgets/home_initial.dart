import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anxiety/pages/home/teddy_controller.dart';

class HomeInitial extends StatelessWidget {
  final _teddyController = TeddyController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.5;
    final fontSize = MediaQuery.of(context).size.width * 0.06;

    return Center(
      child: Container(
        width: width,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            height: 200,
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: FlareActor(
              "assets/Teddy.flr",
              shouldClip: false,
              animation: "fail",
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain,
              controller: _teddyController,
              callback: (name) {
                if (name != "idle") {
                  _teddyController.play("idle");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
