import 'package:flutter_application_1/features/todo/data/models/task_model.dart';

abstract class TodoTaskRemoteDataSource {
  Future<List<TodoTaskModel>> getAllTasks();
  Future<TodoTaskModel> getTask(String id);
  Future<TodoTaskModel> updateTask(String id);
  Future<TodoTaskModel> completeTask(String id);

  Future<TodoTaskModel> createTask(TodoTaskModel todoTask);
}
