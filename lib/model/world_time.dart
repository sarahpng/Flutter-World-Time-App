class WorldTime {
  String dateTime;
  String utcOffset;

  WorldTime({
    required this.dateTime,
    required this.utcOffset,
  });

  factory WorldTime.fromJson(Map<String, dynamic> json) {
    return WorldTime(
      dateTime: json['datetime'],
      utcOffset: json['utc_offset'].substring(1, 3),
    );
  }
}
