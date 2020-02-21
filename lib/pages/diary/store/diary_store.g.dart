// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DiaryStore on _DiaryBase, Store {
  final _$listDiaryAtom = Atom(name: '_DiaryBase.listDiary');

  @override
  List<Diary> get listDiary {
    _$listDiaryAtom.context.enforceReadPolicy(_$listDiaryAtom);
    _$listDiaryAtom.reportObserved();
    return super.listDiary;
  }

  @override
  set listDiary(List<Diary> value) {
    _$listDiaryAtom.context.conditionallyRunInAction(() {
      super.listDiary = value;
      _$listDiaryAtom.reportChanged();
    }, _$listDiaryAtom, name: '${_$listDiaryAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'listDiary: ${listDiary.toString()}';
    return '{$string}';
  }
}
