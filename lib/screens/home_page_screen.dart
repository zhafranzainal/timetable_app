import 'package:flutter/material.dart';
import 'package:timetable_app/public_components/sidebar_menu.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.blue.shade700,
        ),
        drawer: const SidebarMenu(),
      );
}
