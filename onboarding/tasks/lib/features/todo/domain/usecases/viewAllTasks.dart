import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/todo/domain/entities/task.dart';
import 'package:flutter_application_1/features/todo/domain/repositories/todo_repository.dart';

class ViewAllTasks implements UseCaseList<TodoTask, Noparams> {
  final NumberTriviaRepository repository;

  ViewAllTasks(this.repository);
  @override
  Future<Either<Failure, List<TodoTask>>> call(Noparams params) async {
    return await repository.getAllTasks();
  }
}
