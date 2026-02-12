import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utils/custom_widgets/custom_appbar.dart';
import 'package:todo_app/view_models/todo_viewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewmodel>(context, listen: false);
    return Scaffold(
      appBar: CustomAppbar(title: "To-Do app"),
      body: Consumer<TodoViewmodel>(
        builder: (context, viewModel, child) {
          return viewModel.todos.isEmpty
              ? const Center(child: Text("No tasks yet!"))
              : ListView.builder(
                  itemCount: viewModel.todos.length,
                  itemBuilder: (context, index) {
                    final todo = viewModel.todos[index];
                    return ListTile(
                      title: Text(todo.title),
                      leading: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (_) => viewModel.toggleComplete(todo.id),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => viewModel.removeTodo(todo.id),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context, viewModel),
        child: const Icon(Icons.add),
      ),
    );
  }
}

void _showAddDialog(BuildContext context, TodoViewmodel viewModel) {
  final controller = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Add New Task"),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: "Enter task title"),
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              viewModel.addTodo(controller.text);
              Navigator.pop(context);
            }
          },
          child: const Text("Add"),
        ),
      ],
    ),
  );
}
