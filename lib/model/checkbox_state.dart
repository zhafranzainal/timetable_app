class CheckboxState {
  final String day;
  final String date;
  final String time;
  final String title;
  bool value;

  CheckboxState({
    required this.day,
    required this.date,
    required this.time,
    required this.title,
    this.value = false,
  });
}
