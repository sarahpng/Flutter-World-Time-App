import 'package:flutter/material.dart';
import 'package:world_time_app/model/world_time.dart';
import 'package:world_time_app/services/time_convertor.dart';
import 'package:world_time_app/services/timezone.dart';

class TimeProvider extends ChangeNotifier {
  final Timezone _timezone = Timezone();
  String _location = "Germany";
  String _time = "00:00";

  String get location => _location;
  String get time => _time;

  Future<void> fetch({required String location, required url}) async {
    _location = location;
    final worldTime = await _timezone.fetchTime(url);
    _time = timeConvertor(worldTime.dateTime, worldTime.utcOffset);
    notifyListeners();
  }
}
