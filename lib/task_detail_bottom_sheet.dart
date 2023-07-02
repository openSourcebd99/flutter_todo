import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskDetailBottomSheet extends StatelessWidget {
  final Map<String, dynamic> task;
  final VoidCallback onDelete;

  const TaskDetailBottomSheet(
      {Key? key, required this.task, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Title: ${task['title']}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text('Description: ${task['description']}'),
          SizedBox(height: 16.0),
          Text(
              'Deadline: ${DateFormat('yyyy-MM-dd').format(task['deadline'])}'),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: onDelete,
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
