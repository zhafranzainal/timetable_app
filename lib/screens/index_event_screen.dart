import 'package:flutter/material.dart';
import 'package:timetable_app/model/checkbox_state.dart';

class IndexEventScreen extends StatefulWidget {
  const IndexEventScreen({super.key});

  @override
  State<IndexEventScreen> createState() => _IndexEventScreenState();
}

class _IndexEventScreenState extends State<IndexEventScreen> {
  final notifications = [
    CheckboxState(
        day: 'Tue', date: '20 Jun', time: '9.00 am', title: 'PSM Presentation'),
    CheckboxState(
        day: 'Tue', date: '20 Jun', time: '10.00 pm', title: 'OR Registration'),
    CheckboxState(
        day: 'Wed', date: '21 Jun', time: '10.45 am', title: 'AI Presentation'),
    CheckboxState(
        day: 'Thu',
        date: '22 Jun',
        time: '10.45 am',
        title: 'Proposal Presentation'),
    CheckboxState(
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
            ...notifications.map(buildSingleCheckbox).toList(),
          ],
        ),
      );

  Widget buildSingleCheckbox(CheckboxState checkbox) => CheckboxListTile(
        value: checkbox.value,
        secondary: const Icon(Icons.error),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(checkbox.day, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(checkbox.date, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(checkbox.time, style: const TextStyle(fontSize: 16)),
              ],
            ),
            Text(
              checkbox.title,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        onChanged: (value) => setState(() => checkbox.value = value!),
      );
}
