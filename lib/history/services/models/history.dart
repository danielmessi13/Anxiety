import 'tag.dart';

class HistoryModel {
  int pulse;
  DateTime date;
  Tag tag;

  HistoryModel({
    this.pulse,
    this.tag,
    date,
  }) : this.date = date ?? DateTime.now();
}
