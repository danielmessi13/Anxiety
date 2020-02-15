// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Diary on _DiaryBase, Store {
  final _$listDiaryAtom = Atom(name: '_DiaryBase.listDiary');

  @override
  List<DiaryModel> get listDiary {
    _$listDiaryAtom.context.enforceReadPolicy(_$listDiaryAtom);
    _$listDiaryAtom.reportObserved();
    return super.listDiary;
  }

  @override
  set listDiary(List<DiaryModel> value) {
    _$listDiaryAtom.context.conditionallyRunInAction(() {
      super.listDiary = value;
      _$listDiaryAtom.reportChanged();
    }, _$listDiaryAtom, name: '${_$listDiaryAtom.name}_set');
  }

  final _$_DiaryBaseActionController = ActionController(name: '_DiaryBase');

  @override
  dynamic set(List<DiaryModel> value) {
    final _$actionInfo = _$_DiaryBaseActionController.startAction();
    try {
      return super.set(value);
    } finally {
      _$_DiaryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void writeDiary(DiaryModel diaryModel) {
    final _$actionInfo = _$_DiaryBaseActionController.startAction();
    try {
      return super.writeDiary(diaryModel);
    } finally {
      _$_DiaryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteDiary(DiaryModel diaryModel) {
    final _$actionInfo = _$_DiaryBaseActionController.startAction();
    try {
      return super.deleteDiary(diaryModel);
    } finally {
      _$_DiaryBaseActionController.endAction(_$actionInfo);
    }
  }
}
