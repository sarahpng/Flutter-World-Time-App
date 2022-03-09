import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;  //location name for the ui
  late String time; //time in that location
  String flag; //url to an asset flag icon
  String url; // location url for api endpoint
  late bool isDayTime; //true or false if day time or not

  WorldTime({required this.location, required this.flag, required this.url});


  Future<void> getTime() async{
    var Url = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
    Response response = await get(Url);
    Map data = jsonDecode(response.body);
    //print(data);
    //get properties from data
    String dataTime = data["utc_datetime"];
    String offset = data['utc_offset'].substring(1,3);
    // print(dataTime);
    //print(offset);

    // create dateTime object
    DateTime now = DateTime.parse(dataTime);
    now = now.add(Duration(hours: int.parse(offset)));

  //set the time property
    isDayTime = now.hour >= 6 && now.hour <= 20 ? true : false;
    time = DateFormat.jm().format(now);
  }


}

