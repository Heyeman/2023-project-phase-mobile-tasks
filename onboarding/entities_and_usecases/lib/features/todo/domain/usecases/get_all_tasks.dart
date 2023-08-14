import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/todo/domain/entities/todo.dart';
import 'package:flutter_application_1/features/todo/domain/repositories/todo_repository.dart';

class GetAllTasks implements UseCaseList<Todo, Noparams> {
  final NumberTriviaRepository repository;

  GetAllTasks(this.repository);
  @override
  Future<Either<Failure, List<Todo>>> call(Noparams params) async {
    return await repository.getAllTasks();
  }
}
