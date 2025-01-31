import 'package:flutter/material.dart';
import 'package:world_time_app/constants/images.dart';
import 'package:world_time_app/services/timezone_repositories.dart';

class TimeProvider extends ChangeNotifier {
  final Timezone timezone = Timezone();
  String _location = "";
  String _time = "";
  bool _isDayTime = true;
  DateTime _dateTime = DateTime(0);
  String _image = startingbg;
  Color _fontColor = Colors.white;

  String get location => _location;
  String get time => _time;
  String get image => _image;
  Color get fontColor => _fontColor;

  void fetch({required String location, required String continent}) async {
    final worldTime = await timezone.fetchTime(continent, location);
    _location = location;

    _dateTime = DateTime.parse(worldTime.dateTime);
    _time = (DateTime.parse('$_dateTime')).toString().substring(11, 16);
    _isDayTime = int.parse(_time.substring(0, 1)) >= 6 &&
            int.parse(_time.substring(0, 1)) <= 20
        ? true
        : false;
    _image = _isDayTime ? dayTime : nightTime;
    _fontColor = _isDayTime ? Colors.black : Colors.white;
    notifyListeners();
  }

  void updateTime() {
    _dateTime = (_dateTime.add(Duration(seconds: 1)));
    _time = (DateTime.parse('$_dateTime')).toString().substring(11, 16);
    notifyListeners();
  }
}
