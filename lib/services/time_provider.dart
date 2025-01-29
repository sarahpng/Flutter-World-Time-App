import 'package:flutter/material.dart';
import 'package:world_time_app/services/timezone_repositories.dart';

class TimeProvider extends ChangeNotifier {
  final Timezone timezone = Timezone();
  String _location = "";
  String _time = "";
  late DateTime _dateTime = DateTime(0);

  String get location => _location;
  String get time => _time;

  void fetch({required String location, required String continent}) async {
    final worldTime = await timezone.fetchTime(continent, location);
    _location = location;

    _dateTime = DateTime.parse(worldTime.dateTime);
    _time = (DateTime.parse('$_dateTime')).toString().substring(11, 16);

    notifyListeners();
  }

  void updateTime() {
    _dateTime = (_dateTime.add(Duration(seconds: 1)));
    _time = (DateTime.parse('$_dateTime')).toString().substring(11, 16);
    notifyListeners();
  }
}
