import 'package:flutter/material.dart';
import 'package:timetable_app/public_components/sidebar_menu.dart';

class IndexEventScreen extends StatelessWidget {
  const IndexEventScreen({super.key});

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
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
      );
}
