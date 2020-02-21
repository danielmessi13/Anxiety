import 'tag.dart';

class History {
  int id;
  int pulse;
  DateTime date;
  Tag tag;

  History({
    this.id,
    this.pulse,
    this.tag,
    date,
  }) : this.date = date ?? DateTime.now();

  factory History.fromHasura(value) {
    return History(
      id: value['id'],
      pulse: value['pulse'],
      date: DateTime.parse(value['date']),
      tag: Tag.fromHasura(value['tag']),
    );
  }
}
