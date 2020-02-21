class Diary {
  String id;
  DateTime date;
  String title;
  String description;

  Diary({
    this.id,
    this.date,
    this.title,
    this.description,
  });

  factory Diary.fromHasura(value) {
    return Diary(
      id: value['id'],
      date: DateTime.parse(value['date']),
      description: value['description'],
      title: value['title'],
    );
  }
}
