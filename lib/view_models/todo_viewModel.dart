import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoViewmodel extends ChangeNotifier {
  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  void addTodo(String title) {
    final newTodo = TodoModel(id: const Uuid().v4(), title: title);
    _todos.add(newTodo);
    notifyListeners();
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void updateTodo(String id, String newTitle) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.title = newTitle;
    notifyListeners();
  }

  void toggleComplete (String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }
}
