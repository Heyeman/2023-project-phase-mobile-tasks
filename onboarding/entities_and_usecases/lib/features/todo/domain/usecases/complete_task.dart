import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/todo/domain/entities/todo.dart';
import 'package:flutter_application_1/features/todo/domain/repositories/todo_repository.dart';

class GetTask implements UseCase<Todo, Params> {
  final NumberTriviaRepository repository;

  GetTask(this.repository);
  @override
  Future<Either<Failure, Todo>> call(Params params) async {
    return await repository.completeTask(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({required this.number}) : super();
  @override
  List<Object> get props => [number];
}
