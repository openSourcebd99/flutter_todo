import 'package:flutter/material.dart';
import 'add_task_form.dart';
import 'task_detail_bottom_sheet.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Task Management'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> tasks = [
    {
      'title': 'Task 1',
      'description': 'Description 1',
      'deadline': DateTime.now(),
    }
  ];

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: AddTaskForm(
            onSubmit: (value) {
              setState(() {
                tasks.add(value);
              });
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void _showTaskDetails(Map<String, dynamic> task) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return TaskDetailBottomSheet(
          task: task,
          onDelete: () {
            setState(() {
              tasks.remove(task);
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]['title']!),
            subtitle: Text(tasks[index]['description']!),
            onLongPress: () => _showTaskDetails(tasks[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }
}
