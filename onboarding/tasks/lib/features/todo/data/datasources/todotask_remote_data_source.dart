import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/exceptions.dart';
import 'package:flutter_application_1/features/todo/data/models/task_model.dart';
import 'package:flutter_application_1/features/todo/domain/entities/task.dart';
import 'package:http/http.dart' as http;

abstract class TodoTaskRemoteDataSource {
  Future<List<TodoTaskModel>> getAllTasks();
  Future<TodoTaskModel> getTask(String id);
  Future<bool> updateTask(TodoTaskModel todoTask);
  Future<bool> completeTask(String id);

  Future<TodoTaskModel> createTask(TodoTaskModel todoTask);
}

class TodoTaskRemoteDataSourceImpl implements TodoTaskRemoteDataSource {
  final String apiUrl = "myapi.com";
  final http.Client client;

  TodoTaskRemoteDataSourceImpl({required this.client});

  @override
  Future<TodoTaskModel> createTask(TodoTaskModel todoTask) async {
    final response = await client.post('$apiUrl/' as Uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(todoTask.toJson()));

    if (response.statusCode == 201) {
      return TodoTaskModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
    // TODO: implement createTask
  }

  @override
  Future<TodoTaskModel> getTask(String id) async {
    return await requester(id);
  }

  Future<TodoTaskModel> requester(String id) async {
    final response = await client.get('$apiUrl/$id' as Uri,
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return TodoTaskModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TodoTaskModel>> getAllTasks() async {
    final response = await client
        .get('$apiUrl/' as Uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return [TodoTaskModel.fromJson(json.decode(response.body))];
    } else {
      throw ServerException();
    }
    // return await requester('');
  }

  @override
  Future<bool> completeTask(String id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateTask(TodoTaskModel todoTask) async {
    final response = await client.put(
        apiUrl + '/complete/' + todoTask.id as Uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(todoTask.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }
}
