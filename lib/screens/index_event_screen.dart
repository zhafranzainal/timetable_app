import 'package:flutter/material.dart';
import 'package:timetable_app/main.dart';
import 'package:timetable_app/model/task_event_model.dart';

class IndexEventScreen extends StatefulWidget {
  const IndexEventScreen({super.key});

  @override
  State<IndexEventScreen> createState() => _IndexEventScreenState();
}

class _IndexEventScreenState extends State<IndexEventScreen> {
  Future<List<TaskEventModel>> _fetchEventsFromSupabase() async {
    final response = await supabase.from('task_events').select().order('date');

    List<TaskEventModel> taskEvents = [];
    for (final taskEvent in response) {
      taskEvents.add(TaskEventModel(
        title: taskEvent['name'],
        date: taskEvent['date'],
      ));
    }

    return taskEvents;
  }

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
                'All events',
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
            ],
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: FutureBuilder<List<TaskEventModel>>(
          future: _fetchEventsFromSupabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching data'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            }

            Map<String, List<TaskEventModel>> categorizedEvents = {
              'Today': [],
              'Tomorrow': [],
              'After Tomorrow': [],
              'Upcoming Events': [],
            };

            for (var taskEvent in snapshot.data!) {
              final eventDate = DateTime.parse(taskEvent.date);
              final currentDate = DateTime.now();
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

            return ListView(
              padding: const EdgeInsets.all(12),
              children: _buildCategorizedList(categorizedEvents),
            );
          },
        ),
      );

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
                Text('Hari', style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(taskEventModel.date, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text("12.00pm", style: const TextStyle(fontSize: 16)),
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
