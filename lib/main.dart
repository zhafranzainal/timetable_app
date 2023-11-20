import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Timetable Planner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCourseCode = '';
  String selectedSection = '';
  String selectedLab = '';

  List<Course> timetable = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add Course Code
            TextField(
              onChanged: (value) {
                setState(() {
                  selectedCourseCode = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Course Code',
              ),
            ),
            // Add Section
            DropdownButton<String>(
              value: selectedSection.isNotEmpty
                  ? selectedSection
                  : 'Select Section',
              onChanged: (value) {
                setState(() {
                  selectedSection = value!;
                });
              },
              items: <String>['Select Section', '01', '02', '03']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            // Add Lab
            DropdownButton<String>(
              value: selectedLab.isNotEmpty ? selectedLab : 'Select Lab',
              onChanged: (value) {
                setState(() {
                  selectedLab = value!;
                });
              },
              items: <String>['Select Lab', '01A', '01B']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            // Add Button to Generate Timetable
            ElevatedButton(
              onPressed: () {
                // Call the function to generate timetable
                generateTimetable();
              },
              child: Text('Generate Timetable'),
            ),
            // Add List View to display timetable
            Expanded(
              child: ListView.builder(
                itemCount: timetable.length,
                itemBuilder: (context, index) {
                  Course course = timetable[index];
                  return ListTile(
                    title: Text('Course Code: ${course.code}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Course Name: ${course.name}'),
                        Text('Section: ${course.section}'),
                        Text('Lab: ${course.lab}'),
                        Text('Time: ${course.time}'),
                        Text('Location: ${course.location}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void generateTimetable() {
    setState(() {
      timetable = [
        Course(
            code: selectedCourseCode,
            name: 'Database Systems',
            section: selectedSection,
            lab: selectedLab,
            time: '8:00 AM - 10:00 AM',
            location: 'FSK15'),
        Course(
            code: selectedCourseCode,
            name: 'Database Systems',
            section: selectedSection,
            lab: selectedLab,
            time: '10:30 AM - 12:30 PM',
            location: 'FSK15'),
      ];
    });
  }
}

class Course {
  String code;
  String name;
  String section;
  String lab;
  String time;
  String location;

  Course(
      {required this.code,
      required this.name,
      required this.section,
      required this.lab,
      required this.time,
      required this.location});
}
