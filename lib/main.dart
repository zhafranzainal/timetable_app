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
      title: 'Timetable Planning App',
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
  String searchedCourse = '';
  String selectedCourseCode = '';
  String selectedCourseName = '';
  String selectedSection = '';
  String selectedLab = '';

  // Course code to name mapping
  List<String> courseCodes = ['BCS1033', 'BCI2023'];
  Map<String, String> courseMap = {
    'BCS1033': 'SOFTWARE ENGINEERING',
    'BCI2023': 'DATABASE SYSTEMS',
  };

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
            // Search Course
            TextField(
              onChanged: (value) {
                setState(() {
                  searchedCourse = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search Course',
              ),
            ),
            // Show matched course codes and names as dropdown
            searchedCourse.isNotEmpty
                ? Expanded(
                    child: Dialog(
                      child: ListView.builder(
                        itemCount: courseCodes.length,
                        itemBuilder: (context, index) {
                          String courseCode = courseCodes[index];
                          String courseName = courseMap[courseCode] ?? '';
                          if (courseCode
                                  .toLowerCase()
                                  .contains(searchedCourse.toLowerCase()) ||
                              courseName
                                  .toLowerCase()
                                  .contains(searchedCourse.toLowerCase())) {
                            return ListTile(
                              title: Text('$courseCode $courseName'),
                              onTap: () {
                                setState(() {
                                  selectedCourseCode = courseCode;
                                  selectedCourseName = courseName;
                                });
                              },
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
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
                generateTimetable();
              },
              child: const Text('Generate Timetable'),
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
            name: selectedCourseName,
            section: selectedSection,
            lab: selectedLab,
            time: '8:00 AM - 10:00 AM',
            location: 'FSK15'),
        Course(
            code: selectedCourseCode,
            name: selectedCourseName,
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

  Course({
    required this.code,
    required this.name,
    required this.section,
    required this.lab,
    required this.time,
    required this.location,
  });
}
