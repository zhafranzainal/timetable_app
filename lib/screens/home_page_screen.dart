import 'package:flutter/material.dart';
import 'package:timetable_app/public_components/sidebar_menu.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarMenu(),
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          title: const Text('Home', style: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
      );
}
