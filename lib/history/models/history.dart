import 'tag.dart';

class HistoryModel {
  int pulse;
  DateTime dateTime = DateTime.now();
  Tag tag;

  HistoryModel({
    this.pulse,
    this.tag,
  });
}
