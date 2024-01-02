import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timetable_app/main.dart';
import 'package:timetable_app/model/event_model.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<EventModel>> taskEvents = {};

  final TextEditingController _taskEventController = TextEditingController();
  late final ValueNotifier<List<EventModel>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _updateSelectedEvents(selectedDay);
    }
  }

  List<EventModel> _getEventsForDay(DateTime day) {
    return taskEvents[day] ?? [];
  }

  Future<List<EventModel>> _fetchEventsForDay(DateTime day) async {
    final response = await supabase
        .from('task_events')
        .select()
        .eq('date', day.toIso8601String());

    List<EventModel> events = [];
    for (final event in response) {
      events.add(EventModel(event['name']));
    }

    return events;
  }

  void _updateSelectedEvents(DateTime selectedDay) async {
    final events = await _fetchEventsForDay(selectedDay);
    _selectedEvents.value = events;

    taskEvents[selectedDay] = events;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text('Calendar', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                _taskEventController.clear();
                return AlertDialog(
                  scrollable: true,
                  title: const Text('Task event name'),
                  content: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: _taskEventController,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () async {
                        Navigator.of(context).pop();

                        await supabase.from('task_events').insert({
                          'name': _taskEventController.text,
                          'date': _selectedDay!.toIso8601String()
                        });
                      },
                    )
                  ],
                );
              });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TableCalendar(
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
                weekendTextStyle: TextStyle(color: Colors.red),
              ),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  if (day.weekday == DateTime.sunday ||
                      day.weekday == DateTime.saturday) {
                    final text = DateFormat.E().format(day);

                    return Center(
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: _onDaySelected,
              eventLoader: _getEventsForDay,
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              locale: 'en_US',
              availableGestures: AvailableGestures.all,
            ),
            const SizedBox(height: 8),
            Expanded(
                child: ValueListenableBuilder<List<EventModel>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(value[index].title),
                        onTap: () {},
                      ),
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
