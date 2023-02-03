import 'package:flutter/material.dart';
import 'package:leadu/src/data/sources/remote/todo_provider.dart';

class TomorrowScreen extends StatelessWidget {
  const TomorrowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
      ),
      body: StreamBuilder(
          stream: TodoProvider().fetchTodosStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].title),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
