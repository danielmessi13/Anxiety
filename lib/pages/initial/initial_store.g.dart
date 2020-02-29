// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Initial on _InitialBase, Store {
  final _$indexAtom = Atom(name: '_InitialBase.index');

  @override
  int get index {
    _$indexAtom.context.enforceReadPolicy(_$indexAtom);
    _$indexAtom.reportObserved();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.context.conditionallyRunInAction(() {
      super.index = value;
      _$indexAtom.reportChanged();
    }, _$indexAtom, name: '${_$indexAtom.name}_set');
  }

  final _$widthAtom = Atom(name: '_InitialBase.width');

  @override
  double get width {
    _$widthAtom.context.enforceReadPolicy(_$widthAtom);
    _$widthAtom.reportObserved();
    return super.width;
  }

  @override
  set width(double value) {
    _$widthAtom.context.conditionallyRunInAction(() {
      super.width = value;
      _$widthAtom.reportChanged();
    }, _$widthAtom, name: '${_$widthAtom.name}_set');
  }

  final _$colorAtom = Atom(name: '_InitialBase.color');

  @override
  Color get color {
    _$colorAtom.context.enforceReadPolicy(_$colorAtom);
    _$colorAtom.reportObserved();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.context.conditionallyRunInAction(() {
      super.color = value;
      _$colorAtom.reportChanged();
    }, _$colorAtom, name: '${_$colorAtom.name}_set');
  }

  final _$_InitialBaseActionController = ActionController(name: '_InitialBase');

  @override
  void changeWidth(double value) {
    final _$actionInfo = _$_InitialBaseActionController.startAction();
    try {
      return super.changeWidth(value);
    } finally {
      _$_InitialBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'index: ${index.toString()},width: ${width.toString()},color: ${color.toString()}';
    return '{$string}';
  }
}
