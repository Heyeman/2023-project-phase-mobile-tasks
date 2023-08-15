import 'package:flutter_application_1/features/todo/data/models/task_model.dart';

abstract class TodoTaskLocalDataSource {
  Future<List<TodoTaskModel>> getAllTasks();
  Future<TodoTaskModel> getTask(String id);

  Future<void> cacheTask(TodoTaskModel todoToCache);
}
