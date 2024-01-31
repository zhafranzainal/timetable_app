import 'package:timetable_view/timetable_view.dart';

class CourseModel {
  String code;
  String? name;
  String? section;
  String? lab;
  TableEventTime startTime;
  TableEventTime endTime;
  String location;

  CourseModel({
    required this.code,
    this.name,
    this.section,
    this.lab,
    required this.startTime,
    required this.endTime,
    required this.location,
  });
}

Map<String, List<CourseModel>> courseDetailsMap = {
  'BCS3133': [
    CourseModel(
      code: 'BCS3133',
      startTime: TableEventTime(hour: 8, minute: 0),
      endTime: TableEventTime(hour: 9, minute: 50),
      location: 'BK2-06',
    ),
    CourseModel(
      code: 'BCS3133',
      startTime: TableEventTime(hour: 8, minute: 0),
      endTime: TableEventTime(hour: 9, minute: 50),
      location: 'SE1-03',
    ),
  ],
  'BCS3263': [
    CourseModel(
      code: 'BCS3263',
      startTime: TableEventTime(hour: 10, minute: 0),
      endTime: TableEventTime(hour: 11, minute: 50),
      location: 'PS4-01',
    ),
    CourseModel(
      code: 'BCS3263',
      startTime: TableEventTime(hour: 10, minute: 0),
      endTime: TableEventTime(hour: 11, minute: 50),
      location: 'SE3-06',
    ),
  ],
  'BCS3453': [
    CourseModel(
      code: 'BCS3453',
      startTime: TableEventTime(hour: 12, minute: 0),
      endTime: TableEventTime(hour: 13, minute: 50),
      location: 'SE1-03',
    ),
    CourseModel(
      code: 'BCS3453',
      startTime: TableEventTime(hour: 16, minute: 0),
      endTime: TableEventTime(hour: 17, minute: 50),
      location: 'BK2-04',
    ),
  ],
  'BCI3283': [
    CourseModel(
      code: 'BCI3283',
      startTime: TableEventTime(hour: 14, minute: 0),
      endTime: TableEventTime(hour: 15, minute: 50),
      location: 'CS1-01',
    ),
    CourseModel(
      code: 'BCI3283',
      startTime: TableEventTime(hour: 10, minute: 0),
      endTime: TableEventTime(hour: 11, minute: 50),
      location: 'DK2-01',
    ),
  ],
  'BCI3343': [
    CourseModel(
      code: 'BCI3343',
      startTime: TableEventTime(hour: 8, minute: 0),
      endTime: TableEventTime(hour: 9, minute: 50),
      location: 'CS4-07',
    ),
    CourseModel(
      code: 'BCI3343',
      startTime: TableEventTime(hour: 14, minute: 0),
      endTime: TableEventTime(hour: 15, minute: 50),
      location: 'CS4-07',
    ),
  ],
};
