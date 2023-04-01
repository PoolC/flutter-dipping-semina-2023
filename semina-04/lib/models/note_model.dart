class NoteModel {
  int? id;
  String title;
  String body;
  String createDate;

  NoteModel(
      {this.id,
      required this.title,
      required this.body,
      required this.createDate});

  Map<String, dynamic> toMap() =>
      {'id': id, 'title': title, 'body': body, 'createDate': createDate};
}
