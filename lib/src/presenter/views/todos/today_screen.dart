import 'package:flutter/material.dart';
import 'package:leadu/src/base/utils.dart';
import 'package:leadu/src/domain/entities/todo.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  final List<Todo> _todos = [];
  final _listKey = GlobalKey<AnimatedListState>();

  void _addTodo() {
    showSnackBar(context, 'Todo added');

    final target = Todo(
      userId: 1,
      id: _todos.length + 1,
      title: 'Todo ${_todos.length + 1}',
      completed: false,
    );

    _todos.add(target);
    _listKey.currentState?.insertItem(_todos.length - 1);

    setState(() {});
  }

  void _removeTodo(int index) {
    showSnackBar(context, 'Todo removed');
    final target = _todos[index];

    _todos.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => ListItem(
        todo: target,
        animation: animation,
        onPressed: () {},
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _todos.length,
        itemBuilder: (context, index, animation) => ListItem(
            todo: _todos[index],
            animation: animation,
            onPressed: () {
              _removeTodo(index);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodo();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.todo,
    required this.animation,
    required this.onPressed,
  });

  final Todo todo;
  final Animation<double> animation;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => buildItem();

  Widget buildItem() {
    return SizeTransition(
      sizeFactor: animation,
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: ListTile(
              title: Text(todo.title),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onPressed,
              ),
            ),
          ),
          smallVerticalSpace(),
        ],
      ),
    );
  }
}
