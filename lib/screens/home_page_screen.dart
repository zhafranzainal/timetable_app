import 'package:flutter/material.dart';
import 'package:timetable_app/screens/add_timetable_screen.dart';

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

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        )),
      );
}

Widget buildHeader(BuildContext context) => Container(
      color: Colors.blue.shade700,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: 24,
      ),
      child: const Column(children: [
        Text(
          'UMPSA Scheduler',
          style: TextStyle(fontSize: 28, color: Colors.white),
        )
      ]),
    );

Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(15),
    child: Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text('New Timetable'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddTimetableScreen()));
          },
        ),
        const Divider(color: Colors.grey),
        ListTile(
          leading: const Icon(Icons.event),
          title: const Text('All Events'),
          onTap: () {},
        ),
        const Divider(color: Colors.grey),
        ListTile(
          leading: const Icon(Icons.calendar_view_week),
          title: const Text('BCS SEM 1'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.calendar_view_week),
          title: const Text('BCS SEM 2'),
          onTap: () {},
        ),
      ],
    ));
