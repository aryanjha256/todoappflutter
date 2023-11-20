import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Task List'),
      ),
      body: Column(
        children: [
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (task) {
                addTask(task);
              },
              decoration: InputDecoration(
                labelText: 'Add New Task',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_circle_right_sharp),
                  onPressed: () {
                    // Add the task when the add button is pressed
                    addTask(_taskController.text);
                  },
                ),
              ),
              controller: _taskController,
            ),
          ),
        ],
      ),
    );
  }

  // Controller for the task input field
  final TextEditingController _taskController = TextEditingController();

  // Function to add a new task to the list
  void addTask(String task) {
    if (task.isNotEmpty) {
      setState(() {
        tasks.add(task);
        _taskController.clear();
      });
    }
  }
}
