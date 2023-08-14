import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/todo/domain/entities/task.dart';
import 'package:flutter_application_1/features/todo/domain/repositories/todo_repository.dart';
import 'package:flutter_application_1/features/todo/presentation/pages/main.dart';

class CreateTask implements UseCase<TodoTask, Params> {
  final NumberTriviaRepository repository;

  CreateTask(this.repository);
  @override
  Future<Either<Failure, TodoTask>> call(Params params) async {
    return await repository.createTask(params.todoTask);
  }
}

class Params extends Equatable {
  final TodoTask todoTask;

  Params({required this.todoTask}) : super();
  @override
  List<Object> get props => [todoTask];
}
