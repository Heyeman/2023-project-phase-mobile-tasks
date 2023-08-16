import 'package:flutter_application_1/features/todo/data/datasources/todotask_remote_data_source.dart';
import 'package:flutter_application_1/test/fixtures/fixture_reader.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockHttpClient extends Mock implements http.Client {
  void main() {
    TodoTaskRemoteDataSourceImpl dataSource;
    MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
      dataSource = TodoTaskRemoteDataSourceImpl(client: mockHttpClient);
    });
    group('getTasks', () {
      mockHttpClient = MockHttpClient();
      dataSource = TodoTaskRemoteDataSourceImpl(client: mockHttpClient);
      final tNumber = 1;
      test("get request on a URL ", () {
        when(mockHttpClient.get(any, headers: anyNamed("headers")))
            .thenAnswer((_) => http.Response(fixture('todoTask.json'), 200));
        dataSource.getTask("id");
        verify( mockHttpClient.get('http://myapi.com' as Uri, headers:{
          'Content-Type': 'application/json'
        } ))
      });
    });
  }
}
