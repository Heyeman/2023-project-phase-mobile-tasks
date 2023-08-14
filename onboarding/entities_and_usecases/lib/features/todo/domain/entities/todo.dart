import "package:equatable/equatable.dart";
import "package:meta/meta.dart";

class Todo extends Equatable {
  final String title;
  final String description;
  final String deadline;
  final bool isCompleted = false;

  Todo({required this.title, required this.description, required this.deadline})
      : super();

  @override
  List<Object> get props => [title, description, deadline];
}
