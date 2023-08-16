import 'package:flutter_application_1/features/todo/data/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TodoTaskLocalDataSource {
  Future<List<TodoTaskModel>> getAllTasks();
  Future<TodoTaskModel> getTask(String id);

  Future<void> cacheTask(TodoTaskModel todoToCache);
}

class TodoTaskLocalDataSourceImpl implements TodoTaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TodoTaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheTask(TodoTaskModel todoToCache) {
    // TODO: implement cacheTask
    throw UnimplementedError();
  }

  @override
  Future<List<TodoTaskModel>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  Future<TodoTaskModel> getTask(String id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }
}
