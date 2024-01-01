class TaskEventModel {
  final String day;
  final String date;
  final String time;
  final String title;
  bool value;

  TaskEventModel({
    required this.day,
    required this.date,
    required this.time,
    required this.title,
    this.value = false,
  });
}
