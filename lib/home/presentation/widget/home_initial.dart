import 'package:flutter/material.dart';

class HomeInitial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.5;
    final fontSize = MediaQuery.of(context).size.width * 0.06;

    return Center(
      child: Container(
        width: width,
        height: width,
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: "Clique para iniciar a ajuda",
          splashColor: Colors.transparent,
          backgroundColor: Colors.blueGrey[600],
          child: Text(
            "Iniciar",
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
