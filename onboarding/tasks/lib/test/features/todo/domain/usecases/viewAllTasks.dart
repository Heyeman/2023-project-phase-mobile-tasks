import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodoTaskRepository extends Mock implements TodoTaskRepository {}

void main() {
  late GetTaskUs usecase;
  late MockTodoTaskRepository mockTodoTaskRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockTodoTaskRepository = MockTodoTaskRepository();
    usecase = GetConcreteTodoTask(repository: mockTodoTaskRepository);
  });

  final testNumber = 1;
  final testTodoTask = TodoTask(text: 'one is fun', number: 1);

  test('should get trivia for the number from the repository', () async {
    // arrange
    when(() => mockTodoTaskRepository.getConcreteTodoTask(any()))
        .thenAnswer((_) async => Right(testTodoTask));

    // act
    final result = await usecase(params: Params(number: testNumber));

    // assert
    expect(result, Right(testTodoTask));
    verify(() => mockTodoTaskRepository.getConcreteTodoTask(testNumber));
    verifyNoMoreInteractions(mockTodoTaskRepository);
  });
}
