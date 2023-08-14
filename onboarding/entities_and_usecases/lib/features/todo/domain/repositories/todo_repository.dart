import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/features/todo/domain/entities/todo.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, List<Todo>>> getAllTasks();
  Future<Either<Failure, Todo>> getTask(int number);
  Future<Either<Failure, Todo>> updateTask(int number);
  Future<Either<Failure, Todo>> completeTask(int number);
}
