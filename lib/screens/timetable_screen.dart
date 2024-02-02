import 'package:flutter/material.dart';
import 'package:timetable_app/model/course_model.dart';
import 'package:timetable_view/timetable_view.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  final TextEditingController _courseController = TextEditingController();

  final List<LaneEvents> _laneEventsList = [
    LaneEvents(
      lane: Lane(name: 'Mon', laneIndex: 1),
      events: [],
    ),
    LaneEvents(
      lane: Lane(name: 'Tue', laneIndex: 2),
      events: [],
    ),
    LaneEvents(
      lane: Lane(name: 'Wed', laneIndex: 3),
      events: [],
    ),
    LaneEvents(
      lane: Lane(name: 'Thu', laneIndex: 4),
      events: [],
    ),
    LaneEvents(
      lane: Lane(name: 'Fri', laneIndex: 5),
      events: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text('Timetable', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: TimetableView(
        laneEventsList: _buildLaneEvents(),
        onEventTap: onEventTapCallBack,
        timetableStyle: TimetableStyle(
          startHour: 8,
          endHour: 18,
          laneWidth: screenWidth * 0.18,
          timeItemWidth: screenWidth * 0.1,
          timeItemHeight: 66,
        ),
        onEmptySlotTap: onTimeSlotTappedCallBack,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                _courseController.clear();
                return AlertDialog(
                  scrollable: true,
                  title: const Text('Add Course'),
                  content: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: _courseController,
                      decoration:
                          const InputDecoration(labelText: 'Course Code'),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () async {
                        Navigator.of(context).pop();

                        String courseCode = _courseController.text;

                        if (courseCode.isNotEmpty) {
                          CourseModel courseDetails =
                              (courseDetailsMap[courseCode]?.first) ??
                                  CourseModel(
                                    code: courseCode,
                                    day: 2,
                                    startTime:
                                        TableEventTime(hour: 16, minute: 0),
                                    endTime:
                                        TableEventTime(hour: 17, minute: 50),
                                    location: 'Default Location',
                                  );

                          TableEvent newEvent = TableEvent(
                            laneIndex: 1,
                            eventId: _laneEventsList.length + 1,
                            title: courseDetails.code,
                            backgroundColor: Colors.orange.withOpacity(0.8),
                            startTime: courseDetails.startTime,
                            endTime: courseDetails.endTime,
                            location: courseDetails.location,
                          );

                          setState(() {
                            _laneEventsList[courseDetails.day]
                                .events
                                .add(newEvent);
                          });
                        } else {
                          print("Course code is empty");
                        }
                      },
                    )
                  ],
                );
              });
        },
      ),
    );
  }

  List<LaneEvents> _buildLaneEvents() {
    return [..._laneEventsList];
  }

  void onEventTapCallBack(TableEvent event) {
    print(
        "Event Clicked!! LaneIndex ${event.laneIndex} Title: ${event.title} StartHour: ${event.startTime.hour} EndHour: ${event.endTime.hour}");
  }

  void onTimeSlotTappedCallBack(
      int laneIndex, TableEventTime start, TableEventTime end) {
    print(
        "Empty Slot Clicked !! LaneIndex: $laneIndex StartHour: ${start.hour} EndHour: ${end.hour}");
  }
}
