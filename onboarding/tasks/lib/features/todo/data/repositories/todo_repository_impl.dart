import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/exceptions.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/features/todo/domain/entities/task.dart';
import 'package:flutter_application_1/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/network/network_info.dart';
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
    // return ;
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TodoTask>> getTask(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTodoTask = await remoteDataSource.getTask(id);
        localDataSource.cacheTask(remoteTodoTask);
        return Right(remoteTodoTask);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTodoTask = await localDataSource.getTask(id);
        return Right(localTodoTask);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, TodoTask>> updateTask(String id) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
