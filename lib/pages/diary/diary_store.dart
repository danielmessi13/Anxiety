import 'dart:async';

import 'package:flutter_anxiety/models/diary_repository.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_anxiety/models/diary.dart';

part 'diary_store.g.dart';

class DiaryStore = _DiaryBase with _$DiaryStore;

abstract class _DiaryBase with Store {
  final HasuraConnect _connection;
  DiaryRepository _diaryRepository;

  StreamSubscription diaries;

  @observable
  List<Diary> listDiary = ObservableList.of([]);

  _DiaryBase(this._connection) {
    _diaryRepository = DiaryRepository(_connection);
    _startListenDiaries();
  }

  void _startListenDiaries() {
    diaries = _diaryRepository.listenDiaries().listen((data) {
      listDiary = data;
    });
  }

  void addDiary(String title, String description) {
    _diaryRepository.addDiary(title, description);
  }

  void deleteDiary(String id) {
    _diaryRepository.deleteDiary(id);
  }

  void dispose() {
    diaries.cancel();
  }
}
