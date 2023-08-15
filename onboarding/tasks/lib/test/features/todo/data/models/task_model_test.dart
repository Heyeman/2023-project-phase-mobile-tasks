import 'dart:convert';

import 'package:flutter_application_1/features/todo/data/models/task_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTodoTaskModel = TodoTaskModel(
      id: "1", title: "To do", deadline: "May 20", description: "Desc");

  test('should be a subclass of TodoTask entity', () async {
    expect(tTodoTaskModel, isA<TodoTaskModel>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON is inserted', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));

      // act
      final result = TodoTaskModel.fromJson(json: jsonMap);

      // assert
      expect(result, tTodoTaskModel);
    });
  });

  // group('toJson', () {
  //   test('should return a valid model when the JSON number is integer',
  //       () async {
  //     // arrange
  //     final Map<String, dynamic> expectedMap = {
  //       "text": "trivia test",
  //       "number": 1
  //     };
  //     // act
  //     final result = tTodoTaskModel.toJson();

  //     // assert
  //     expect(result, expectedMap);
  //   });
  // });
}
