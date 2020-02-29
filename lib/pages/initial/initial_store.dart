import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'initial_store.g.dart';

class Initial = _InitialBase with _$Initial;

abstract class _InitialBase with Store {
  final List<Color> colors = [
    Colors.blue[100],
    Colors.blue[200],
    Colors.blue[300],
    Colors.blue[400],
    Colors.blue[500],
    Colors.blue[600],
    Colors.blue[700],
    Colors.blue[800],
    Colors.red[400],
  ];

  _InitialBase() {
    color = colors[0];
  }

  @observable
  int index = 0;

  @observable
  double width = 0.0;

  @observable
  Color color;

  @action
  void changeWidth(double value) {
    if (value > 0) {
      if (value < width && index > 0) {
        index--;
        color = colors[index];
      } else if (index < colors.length - 1 &&
          this.width > 40 &&
          value > width) {
        index++;
        color = colors[index];
      }
      width = value;
    }
  }
}
