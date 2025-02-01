import 'package:flutter/material.dart';
import 'package:world_time_app/constants/routes.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        // '/': (context) => CountryTimeView(),
        locations: (context) => CountryListView(),
      },
      home: const CountryTimeView(),
    );
  }
}
