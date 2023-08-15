import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/todo/domain/entities/task.dart';
import 'package:flutter_application_1/features/todo/domain/repositories/todo_repository.dart';

class GetTask implements UseCase<TodoTask, Params> {
  final TodoTaskRepository repository;

  GetTask(this.repository);
  @override
  Future<Either<Failure, TodoTask>> call(Params params) async {
    return await repository.completeTask(params.id);
  }
}

class Params extends Equatable {
  final String id;

  Params({required this.id}) : super();
  @override
  List<Object> get props => [id];
}
