import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anxiety/pages/home/teddy_controller.dart';

class InitalPage extends StatelessWidget {
  final _teddyController = TeddyController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.5;
    final fontSize = MediaQuery.of(context).size.width * 0.06;

    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "Clique no nosso mascote para começar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[600],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  width: double.infinity,
                ),
                AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  color: Colors.white,
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () {
                _teddyController.play("success");
              },
              child: FlareActor(
                "assets/Teddy.flr",
                shouldClip: false,
                animation: "fail",
                alignment: Alignment.bottomCenter,
                fit: BoxFit.contain,
                controller: _teddyController,
                callback: (name) {
                  // if (name != "idle") {
                  // _teddyController.play("idle");
                  // }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
