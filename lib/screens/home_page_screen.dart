import 'package:flutter/material.dart';
import 'package:timetable_app/public_components/sidebar_menu.dart';
import 'package:timetable_app/screens/create_timetable_screen.dart';

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
        body: Center(
          child: Image.asset(
            'assets/images/logo_umpsa.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateTimetableScreen()));
          },
        ),
      );
}
