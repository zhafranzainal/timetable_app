import 'package:flutter/material.dart';
import 'package:timetable_view/timetable_view.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
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
            startTime: TableEventTime(hour: 8, minute: 0),
            endTime: TableEventTime(hour: 9, minute: 50),
          ),
          TableEvent(
            laneIndex: 1,
            eventId: 2,
            title: 'BCS3263',
            startTime: TableEventTime(hour: 10, minute: 0),
            endTime: TableEventTime(hour: 11, minute: 50),
          ),
          TableEvent(
            laneIndex: 3,
            eventId: 3,
            title: 'BCS3453',
            startTime: TableEventTime(hour: 12, minute: 0),
            endTime: TableEventTime(hour: 13, minute: 50),
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
            startTime: TableEventTime(hour: 14, minute: 0),
            endTime: TableEventTime(hour: 15, minute: 50),
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
            startTime: TableEventTime(hour: 10, minute: 0),
            endTime: TableEventTime(hour: 11, minute: 50),
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
            startTime: TableEventTime(hour: 8, minute: 0),
            endTime: TableEventTime(hour: 9, minute: 50),
          ),
          TableEvent(
            laneIndex: 4,
            eventId: 5,
            title: 'BCI3343',
            startTime: TableEventTime(hour: 14, minute: 0),
            endTime: TableEventTime(hour: 15, minute: 50),
          ),
          TableEvent(
            laneIndex: 4,
            eventId: 3,
            title: 'BCS3453',
            startTime: TableEventTime(hour: 16, minute: 0),
            endTime: TableEventTime(hour: 17, minute: 50),
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
            startTime: TableEventTime(hour: 8, minute: 0),
            endTime: TableEventTime(hour: 9, minute: 50),
          ),
          TableEvent(
            laneIndex: 5,
            eventId: 2,
            title: 'BCS3263',
            startTime: TableEventTime(hour: 10, minute: 0),
            endTime: TableEventTime(hour: 11, minute: 50),
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
