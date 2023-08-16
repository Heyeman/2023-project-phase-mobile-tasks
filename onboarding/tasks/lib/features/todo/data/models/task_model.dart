import 'package:flutter_application_1/features/todo/domain/entities/task.dart';

class TodoTaskModel extends TodoTask {
  TodoTaskModel(
      {required String title,
      required String description,
      required String deadline,
      required String id})
      : super(
            title: title, description: description, deadline: deadline, id: id);
  factory TodoTaskModel.fromJson(Map<String, dynamic> json) {
    return TodoTaskModel(
        title: json['title'],
        description: json['description'],
        deadline: json['deadline'],
        id: json['id']);
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "deadline": deadline,
      "id": id
    };
  }
}
