import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/features/todo/domain/entities/task.dart';
import 'package:flutter_application_1/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/platform/network_info.dart';
import '../datasources/todotask_local_data_source.dart';
import '../datasources/todotask_remote_data_source.dart';

class TodoTaskRepositoryImpl implements TodoTaskRepository {
  final TodoTaskLocalDataSource localDataSource;
  final TodoTaskRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TodoTaskRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, TodoTask>> completeTask(String id) {
    // TODO: implement completeTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TodoTask>> createTask(TodoTask todoTask) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TodoTask>>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TodoTask>> getTask(String id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TodoTask>> updateTask(String id) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
