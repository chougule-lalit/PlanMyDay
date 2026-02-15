class Schedule {
  final DateTime date;
  final List<TaskItem> tasks;

  Schedule({required this.date, required this.tasks});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      date: DateTime.parse(json['date']),
      tasks: (json['tasks'] as List).map((t) => TaskItem.fromJson(t)).toList(),
    );
  }
}

class TaskItem {
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final String type; // Focus, Travel, Buffer, Errand
  final String status;
  final String? location;

  TaskItem({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.type,
    required this.status,
    this.location,
  });

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      title: json['title'],
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      type: json['type'],
      status: json['status'],
      location: json['location'],
    );
  }
}
