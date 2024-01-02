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
