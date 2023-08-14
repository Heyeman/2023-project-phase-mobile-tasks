import "package:equatable/equatable.dart";
import "package:meta/meta.dart";

class TodoTask extends Equatable {
  final String id;
  final String title;
  final String description;
  final String deadline;
  final bool isCompleted = false;

  TodoTask(
      {required this.title,
      required this.description,
      required this.deadline,
      required this.id})
      : super();

  @override
  List<Object> get props => [title, description, deadline];
}
