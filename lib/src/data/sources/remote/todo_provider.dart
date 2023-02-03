import 'dart:convert';

import 'package:leadu/src/model/entities/todo.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'https://jsonplaceholder.typicode.com/todos';

class TodoProvider {
  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final todos = jsonDecode(response.body) as List;
      return todos.map((todo) => Todo.fromJson(todo)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Stream<List<Todo>> fetchTodosStream() {
    return Stream.periodic(const Duration(seconds: 5))
        .asyncMap((_) => fetchTodos());
  }
}
