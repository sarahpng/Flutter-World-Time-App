import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:world_time_app/services/time_provider.dart';
import 'package:world_time_app/views/country_list_view.dart';
import 'package:world_time_app/views/country_time_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimeProvider>(
      create: (context) => TimeProvider()
        ..fetch(continent: 'Asia', location: 'Karachi', country: 'Pakistan'),
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          '/home': (context) => CountryTimeView(),
          '/location': (context) => CountryListView(),
        },
        home: CountryTimeView(),
      ),
    );
  }
}
