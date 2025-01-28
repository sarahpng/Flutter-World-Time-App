import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:world_time_app/model/world_time.dart';
import 'package:http/http.dart' as http;

class Timezone {
  final dio = Dio();
  final _url = 'http://worldtimeapi.org/api/timezone/';
  Future<WorldTime> fetchTime(String location) async {
    print('in fetching $location');
    final response = await dio.get('$_url$location');
    if (response.statusCode == 200) {
      print(response.data);
      Map<String, dynamic> jsonResponse = response.data;

      return WorldTime.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to fetch post: ${response.statusCode}');
    }
  }
}

void main() {
  print('running fetch ');
  Timezone time = Timezone();
  time.fetchTime('Europe/Riga').then((WorldTime x) {
    print(x.dateTime);
  });
}

fetch() async {}
