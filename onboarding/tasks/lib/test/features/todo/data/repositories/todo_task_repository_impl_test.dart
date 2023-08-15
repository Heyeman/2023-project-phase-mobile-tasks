import 'package:flutter_application_1/core/platform/network_info.dart';
import 'package:flutter_application_1/features/todo/data/datasources/todotask_local_data_source.dart';
import 'package:flutter_application_1/features/todo/data/datasources/todotask_remote_data_source.dart';
import 'package:flutter_application_1/features/todo/data/repositories/todo_repository_impl.dart';
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
      networkInfo: mockNetworkInfo
    );
  });
}
