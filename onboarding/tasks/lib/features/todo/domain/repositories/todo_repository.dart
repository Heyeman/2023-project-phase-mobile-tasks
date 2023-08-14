import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/features/todo/domain/entities/task.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, List<TodoTask>>> getAllTasks();
  Future<Either<Failure, TodoTask>> getTask(String id);
  Future<Either<Failure, TodoTask>> updateTask(String id);
  Future<Either<Failure, TodoTask>> completeTask(String id);

  Future<Either<Failure, TodoTask>> createTask(TodoTask todoTask);
}
