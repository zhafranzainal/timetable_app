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
        day: 'Tue', date: '20 Jun', time: '9.00 am', title: 'PSM Presentation'),
    TaskEventModel(
        day: 'Tue', date: '20 Jun', time: '10.00 pm', title: 'OR Registration'),
    TaskEventModel(
        day: 'Wed', date: '21 Jun', time: '10.45 am', title: 'AI Presentation'),
    TaskEventModel(
        day: 'Thu',
        date: '22 Jun',
        time: '10.45 am',
        title: 'Proposal Presentation'),
    TaskEventModel(
        day: 'Thu',
        date: '29 Jun',
        time: '12.00 pm',
        title: 'SPM Final Assessment'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
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
          children: [
            const Text(
              'Today',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.black),
            ...taskEvents.map(buildSingleCheckbox).toList(),
          ],
        ),
      );

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
