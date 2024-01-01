import 'package:flutter/material.dart';
import 'package:timetable_app/model/task_event_model.dart';

class IndexEventScreen extends StatefulWidget {
  const IndexEventScreen({super.key});

  @override
  State<IndexEventScreen> createState() => _IndexEventScreenState();
}

class _IndexEventScreenState extends State<IndexEventScreen> {
  final taskEvents = [
    TaskEventModel(
        day: 'Tue',
        date: '2023-06-20',
        time: '9.00 am',
        title: 'PSM Presentation'),
    TaskEventModel(
        day: 'Tue',
        date: '2023-06-20',
        time: '10.00 pm',
        title: 'OR Registration'),
    TaskEventModel(
        day: 'Wed',
        date: '2023-06-21',
        time: '10.45 am',
        title: 'AI Presentation'),
    TaskEventModel(
        day: 'Thu',
        date: '2023-06-22',
        time: '10.45 am',
        title: 'Proposal Presentation'),
    TaskEventModel(
        day: 'Thu',
        date: '2023-06-29',
        time: '12.00 pm',
        title: 'SPM Final Assessment'),
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, List<TaskEventModel>> categorizedEvents = {
      'Today': [],
      'Tomorrow': [],
      'After Tomorrow': [],
      'Upcoming Events': [],
    };

    for (var taskEvent in taskEvents) {
      final eventDate = DateTime.parse(taskEvent.date);
      final currentDate = DateTime(2023, 6, 20);
      final difference = eventDate.difference(currentDate).inDays;

      if (difference == 0) {
        categorizedEvents['Today']!.add(taskEvent);
      } else if (difference == 1) {
        categorizedEvents['Tomorrow']!.add(taskEvent);
      } else if (difference == 2) {
        categorizedEvents['After Tomorrow']!.add(taskEvent);
      } else {
        categorizedEvents['Upcoming Events']!.add(taskEvent);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Events',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'June 2023',
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ],
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: _buildCategorizedList(categorizedEvents),
      ),
    );
  }

  List<Widget> _buildCategorizedList(
      Map<String, List<TaskEventModel>> categorizedEvents) {
    List<Widget> listWidgets = [];

    categorizedEvents.forEach((category, taskEvents) {
      if (taskEvents.isNotEmpty) {
        listWidgets.addAll([
          Text(
            category,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const Divider(color: Colors.black),
        ]);

        listWidgets.addAll(taskEvents.map(buildSingleCheckbox).toList());
      }
    });

    return listWidgets;
  }

  Widget buildSingleCheckbox(TaskEventModel taskEventModel) => CheckboxListTile(
        value: taskEventModel.value,
        secondary: const Icon(Icons.error),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(taskEventModel.day, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(taskEventModel.date, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(taskEventModel.time, style: const TextStyle(fontSize: 16)),
              ],
            ),
            Text(
              taskEventModel.title,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        onChanged: (value) => setState(() => taskEventModel.value = value!),
      );
}
