import 'package:flutter/material.dart';

class AddTaskWidget extends StatefulWidget {
  final Function(String) onTaskAdded;

  const AddTaskWidget({super.key, required this.onTaskAdded});

  @override
  AddTaskWidgetState createState() => AddTaskWidgetState();
}

class AddTaskWidgetState extends State<AddTaskWidget> {
  final _controller = TextEditingController();

  void _addTask() {
    final task = _controller.text.trim();
    if (task.isNotEmpty) {
      widget.onTaskAdded(task);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter task name',
            ),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: _addTask,
          child: const Text('Add Task'),
        ),
      ],
    );
  }
}

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  @override
  TaskListWidgetState createState() => TaskListWidgetState();
}

class TaskListWidgetState extends State<TaskListWidget> {
  List<String> tasks = [];

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tasks:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(tasks[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        AddTaskWidget(onTaskAdded: _addTask),
      ],
    );
  }
}
