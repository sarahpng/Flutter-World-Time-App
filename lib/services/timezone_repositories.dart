// import 'dart:convert';
import 'dart:convert';
import 'package:world_time_app/model/world_time.dart';
import 'package:http/http.dart' as http;

class Timezone {
  // final _url = 'http://worldtimeapi.org/api/timezone/';

  final _url = 'https://timeapi.io/api/time/current/zone?timeZone=';

  Future<WorldTime> fetchTime(
    String continent,
    String city,
  ) async {
    final response = await http.get(Uri.parse('$_url$continent%2F$city'));
    print('$_url$continent%2F$city');
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return WorldTime.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to fetch post: ${response.statusCode}');
    }
  }
}
