import 'package:flutter/material.dart';
import 'package:timetable_app/model/checkbox_state.dart';

class IndexEventScreen extends StatefulWidget {
  const IndexEventScreen({super.key});

  @override
  State<IndexEventScreen> createState() => _IndexEventScreenState();
}

class _IndexEventScreenState extends State<IndexEventScreen> {
  final notifications = [
    CheckboxState(title: 'PSM Presentation'),
    CheckboxState(title: 'OR Registration'),
    CheckboxState(title: 'AI Presentation'),
    CheckboxState(title: 'Proposal Presentation'),
    CheckboxState(title: 'SPM Final Assessment'),
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
        title: Text(
          checkbox.title,
          style: const TextStyle(fontSize: 20),
        ),
        onChanged: (value) => setState(() => checkbox.value = value!),
      );
}
