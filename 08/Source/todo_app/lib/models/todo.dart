// To parse this JSON data, do
//
//     final toDo = toDoFromJson(jsonString);

import 'dart:convert';

List<ToDo> toDoFromJson(String str) => new List<ToDo>.from(json.decode(str).map((x) => ToDo.fromJson(x)));

String toDoToJson(List<ToDo> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ToDo {
  int id;
  String description;
  DateTime date;
  bool finished;

  ToDo({
    this.id,
    this.description,
    this.date,
    this.finished,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) => new ToDo(
    id: json["id"],
    description: json["description"],
    date: DateTime.parse(json["date"]),
    finished: json["finished"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "date": date.toIso8601String(),
    "finished": finished,
  };
}
