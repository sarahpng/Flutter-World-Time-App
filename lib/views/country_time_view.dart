import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time_app/services/time_provider.dart';

class CountryTimeView extends StatefulWidget {
  const CountryTimeView({super.key});

  @override
  State<CountryTimeView> createState() => _CountryTimeViewState();
}

class _CountryTimeViewState extends State<CountryTimeView> {
  late TimeProvider timeProvider;
  @override
  void initState() {
    super.initState();
    timeProvider = TimeProvider();
    Timer.periodic(Duration(seconds: 1), (timer) {
      timeProvider.updateTime();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timeProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) =>
            timeProvider..fetch(location: 'Karachi', continent: 'Asia'),
        child: Consumer<TimeProvider>(builder: (context, provider, child) {
          return NotificationListener(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(provider.location),
              Text(provider.time),
              TextButton(
                onPressed: () {
                  provider.fetch(location: 'Tokyo', continent: 'Asia');
                },
                child: Text('Fetch new data'),
              ),
            ],
          ));
        }),
      ),
    );
  }
}
