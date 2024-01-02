class TaskEventModel {
  final String title;
  final String date;
  bool value;

  TaskEventModel({
    required this.title,
    required this.date,
    this.value = false,
  });
}
