import 'package:flutter/material.dart';
import 'package:timetable_view/timetable_view.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  final TextEditingController _courseController = TextEditingController();

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
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () async {
                        Navigator.of(context).pop();
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
    return [
      LaneEvents(
        lane: Lane(name: 'Mon', laneIndex: 1),
        events: [
          TableEvent(
            laneIndex: 1,
            eventId: 1,
            title: 'BCS3133',
            backgroundColor: Colors.greenAccent.withOpacity(0.8),
            startTime: TableEventTime(hour: 8, minute: 0),
            endTime: TableEventTime(hour: 9, minute: 50),
            location: 'BK2-06',
          ),
          TableEvent(
            laneIndex: 1,
            eventId: 2,
            title: 'BCS3263',
            backgroundColor: Colors.green.withOpacity(0.8),
            startTime: TableEventTime(hour: 10, minute: 0),
            endTime: TableEventTime(hour: 11, minute: 50),
            location: 'PS4-01',
          ),
          TableEvent(
            laneIndex: 3,
            eventId: 3,
            title: 'BCS3453',
            backgroundColor: Colors.purpleAccent.withOpacity(0.8),
            startTime: TableEventTime(hour: 12, minute: 0),
            endTime: TableEventTime(hour: 13, minute: 50),
            location: 'SE1-03',
          ),
        ],
      ),
      LaneEvents(
        lane: Lane(name: 'Tue', laneIndex: 2),
        events: [
          TableEvent(
            laneIndex: 2,
            eventId: 4,
            title: 'BCI3283',
            backgroundColor: Colors.purple.withOpacity(0.8),
            startTime: TableEventTime(hour: 14, minute: 0),
            endTime: TableEventTime(hour: 15, minute: 50),
            location: 'CS1-01',
          ),
        ],
      ),
      LaneEvents(
        lane: Lane(name: 'Wed', laneIndex: 3),
        events: [
          TableEvent(
            laneIndex: 3,
            eventId: 4,
            title: 'BCI3283',
            backgroundColor: Colors.purple.withOpacity(0.8),
            startTime: TableEventTime(hour: 10, minute: 0),
            endTime: TableEventTime(hour: 11, minute: 50),
            location: 'DK2-01',
          ),
        ],
      ),
      LaneEvents(
        lane: Lane(name: 'Thu', laneIndex: 4),
        events: [
          TableEvent(
            laneIndex: 4,
            eventId: 5,
            title: 'BCI3343',
            backgroundColor: Colors.deepPurpleAccent.withOpacity(0.8),
            startTime: TableEventTime(hour: 8, minute: 0),
            endTime: TableEventTime(hour: 9, minute: 50),
            location: 'CS4-07',
          ),
          TableEvent(
            laneIndex: 4,
            eventId: 5,
            title: 'BCI3343',
            backgroundColor: Colors.deepPurpleAccent.withOpacity(0.8),
            startTime: TableEventTime(hour: 14, minute: 0),
            endTime: TableEventTime(hour: 15, minute: 50),
            location: 'CS4-07',
          ),
          TableEvent(
            laneIndex: 4,
            eventId: 3,
            title: 'BCS3453',
            backgroundColor: Colors.purpleAccent.withOpacity(0.8),
            startTime: TableEventTime(hour: 16, minute: 0),
            endTime: TableEventTime(hour: 17, minute: 50),
            location: 'BK2-04',
          ),
        ],
      ),
      LaneEvents(
        lane: Lane(name: 'Fri', laneIndex: 5),
        events: [
          TableEvent(
            laneIndex: 5,
            eventId: 1,
            title: 'BCS3133',
            backgroundColor: Colors.greenAccent.withOpacity(0.8),
            startTime: TableEventTime(hour: 8, minute: 0),
            endTime: TableEventTime(hour: 9, minute: 50),
            location: 'SE1-03',
          ),
          TableEvent(
            laneIndex: 5,
            eventId: 2,
            title: 'BCS3263',
            backgroundColor: Colors.green.withOpacity(0.8),
            startTime: TableEventTime(hour: 10, minute: 0),
            endTime: TableEventTime(hour: 11, minute: 50),
            location: 'SE3-06',
          ),
        ],
      ),
    ];
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
