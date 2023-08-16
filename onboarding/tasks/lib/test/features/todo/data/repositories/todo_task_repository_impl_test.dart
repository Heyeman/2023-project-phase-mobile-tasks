import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/network/network_info.dart';
import 'package:flutter_application_1/features/todo/data/datasources/todotask_local_data_source.dart';
import 'package:flutter_application_1/features/todo/data/datasources/todotask_remote_data_source.dart';
import 'package:flutter_application_1/features/todo/data/models/task_model.dart';
import 'package:flutter_application_1/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:flutter_application_1/features/todo/domain/entities/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements TodoTaskRemoteDataSource {}

class MockLocalDataSource extends Mock implements TodoTaskLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  TodoTaskRepositoryImpl respository;
  MockLocalDataSource mockLocalDataSource;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    respository = TodoTaskRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  group('get tasks', () {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    respository = TodoTaskRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo);

    final tNumber = 1;
    final tTodoTaskModel = TodoTaskModel(
        title: "title123",
        description: "description 214",
        deadline: "deadline",
        id: "id");
    final TodoTask tTodoTask = tTodoTaskModel;

    test('check if device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      respository.getTask("id");

      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data', () async {
        when(mockRemoteDataSource.getTask("id"))
            .thenAnswer((_) async => tTodoTaskModel);
        final result = await mockRemoteDataSource.getTask("id");
        expect(result, equals(Right(tTodoTask)));
      });
    });
  });
}
