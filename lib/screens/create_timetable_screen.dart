import 'package:flutter/material.dart';
import 'package:timetable_app/model/course_model.dart';

class CreateTimetableScreen extends StatefulWidget {
  const CreateTimetableScreen({super.key});

  @override
  State<CreateTimetableScreen> createState() => _CreateTimetableScreenState();
}

class _CreateTimetableScreenState extends State<CreateTimetableScreen> {
  String searchedCourse = '';
  String selectedCourseCode = '';
  String selectedCourseName = '';
  String selectedSection = '';
  String selectedLab = '';

  // Course code to name mapping
  List<String> courseCodes = ['BCS1033', 'BCI2023', 'BCS3133', 'BCS3263'];
  Map<String, String> courseMap = {
    'BCS1033': 'SOFTWARE ENGINEERING',
    'BCI2023': 'DATABASE SYSTEMS',
    'BCS3133': 'SOFTWARE ENGINEERING PRACTICES',
    'BCS3263': 'SOFTWARE QUALITY ASSURANCE',
  };

  List<CourseModel> timetable = [];
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title:
            const Text('New Timetable', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Search Course
            TextField(
              onChanged: (value) {
                setState(() {
                  searchedCourse = value;
                  isTrue = true;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search Course',
              ),
            ),
            // Show matched course codes and names as dropdown
            searchedCourse.isNotEmpty
                ? Expanded(
                    child: Visibility(
                      visible: isTrue,
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
                                  isTrue = !isTrue;

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
                  CourseModel course = timetable[index];
                  return ListTile(
                    title: Text('Course Code: ${course.code}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Course Name: ${course.name}'),
                        Text('Section: ${course.section}'),
                        Text('Lab: ${course.lab}'),
                        Text('Time: ${course.startTime}'),
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
      timetable = [];
    });
  }
}
