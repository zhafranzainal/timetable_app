import 'package:flutter/material.dart';
import 'package:timetable_view/timetable_view.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
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
          timetableStyle: const TimetableStyle(),
          onEmptySlotTap: onTimeSlotTappedCallBack,
        ),
      );

  List<LaneEvents> _buildLaneEvents() {
    return [
      LaneEvents(
        lane: Lane(name: 'Monday', laneIndex: 1),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: 'Tuesday', laneIndex: 2),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: 'Wednesday', laneIndex: 3),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: 'Thursday', laneIndex: 4),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: 'Friday', laneIndex: 5),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: 'Saturday', laneIndex: 6),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: 'Sunday', laneIndex: 7),
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
