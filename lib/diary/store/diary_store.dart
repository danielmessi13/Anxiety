import 'package:flutter_anxiety/diary/models/diary.dart';
import 'package:mobx/mobx.dart';

part 'diary_store.g.dart';

class Diary = _DiaryBase with _$Diary;

abstract class _DiaryBase with Store {
  @observable
  List<DiaryModel> listDiary = [
    DiaryModel(
      title: "Trabalho",
      description: "Hoje o dia foi horrivel no trabalho",
    ),
    DiaryModel(
      title: "Apresentação TCC",
      description: "Foi muito tenso apresentar meu TCC",
    ),
    DiaryModel(
      title: "Sair de casa",
      description: "Hoje o finalmente eu consegui sair de casa",
    ),
  ];

  @action
  set(List<DiaryModel> value) => listDiary = value;

  @action
  void writeDiary(DiaryModel diaryModel) => listDiary.add(diaryModel);

  @action
  void deleteDiary(DiaryModel diaryModel) => listDiary.remove(diaryModel);
}
