class WorldTime {
  String dateTime;

  WorldTime({
    required this.dateTime,
  });

  factory WorldTime.fromJson(Map<String, dynamic> json) {
    return WorldTime(
      dateTime: json['dateTime'],
    );
  }
}
