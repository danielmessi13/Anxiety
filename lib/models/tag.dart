class Tag {
  int id;
  String title;

  Tag({this.id, this.title});

  factory Tag.fromHasura(value) {
    return Tag(id: value['id'], title: value['title']);
  }
}
