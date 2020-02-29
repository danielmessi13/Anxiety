import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anxiety/pages/home/teddy_controller.dart';
import 'package:flutter_anxiety/pages/initial/initial_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InitalPage extends StatelessWidget {
  final _teddyController = TeddyController();
  final _initialController = Initial();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Text("Aumentar"),
                onPressed: () {
                  _initialController.changeWidth(_initialController.width + 10);
                },
              ),
              RaisedButton(
                child: Text("Diminuir"),
                onPressed: () {
                  _initialController.changeWidth(_initialController.width - 10);
                },
              ),
            ],
          ),
          Expanded(
            flex: 2,
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
            child: Observer(
              builder: (_) => AnimatedContainer(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: _initialController.width,
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  color: _initialController.color,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () {
                _teddyController.play("fail");
              },
              child: FlareActor(
                "assets/Teddy.flr",
                shouldClip: false,
                animation: "fail",
                alignment: Alignment.bottomCenter,
                fit: BoxFit.contain,
                controller: _teddyController,
                callback: (name) {
                  if (name != "fail") {
                    _teddyController.play("success");
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
