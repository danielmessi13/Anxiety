// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoryStore on _HistoryBase, Store {
  final _$historyListAtom = Atom(name: '_HistoryBase.historyList');

  @override
  List<History> get historyList {
    _$historyListAtom.context.enforceReadPolicy(_$historyListAtom);
    _$historyListAtom.reportObserved();
    return super.historyList;
  }

  @override
  set historyList(List<History> value) {
    _$historyListAtom.context.conditionallyRunInAction(() {
      super.historyList = value;
      _$historyListAtom.reportChanged();
    }, _$historyListAtom, name: '${_$historyListAtom.name}_set');
  }

  final _$getMyHistoryAsyncAction = AsyncAction('getMyHistory');

  @override
  Future<void> getMyHistory() {
    return _$getMyHistoryAsyncAction.run(() => super.getMyHistory());
  }

  final _$_HistoryBaseActionController = ActionController(name: '_HistoryBase');

  @override
  dynamic set(List<History> value) {
    final _$actionInfo = _$_HistoryBaseActionController.startAction();
    try {
      return super.set(value);
    } finally {
      _$_HistoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addHistory(History historyModel) {
    final _$actionInfo = _$_HistoryBaseActionController.startAction();
    try {
      return super.addHistory(historyModel);
    } finally {
      _$_HistoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'historyList: ${historyList.toString()}';
    return '{$string}';
  }
}
