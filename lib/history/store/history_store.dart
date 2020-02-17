import 'package:mobx/mobx.dart';

import 'package:flutter_anxiety/history/models/history.dart';
import 'package:flutter_anxiety/history/models/tag.dart';

part 'history_store.g.dart';

class HistoryStore = _HistoryBase with _$HistoryStore;

abstract class _HistoryBase with Store {
  @observable
  List<HistoryModel> historyList = ObservableList.of([
    HistoryModel(
      pulse: 72,
      tag: Tag(tag: 'Resting'),
    ),
    HistoryModel(
      pulse: 121,
      tag: Tag(tag: 'Workout'),
    ),
  ]);

  @action
  set(List<HistoryModel> value) => historyList = value;

  @action
  void addHistory(HistoryModel historyModel) => historyList.add(historyModel);
}
