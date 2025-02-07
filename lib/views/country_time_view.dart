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
  @override
  void initState() {
    super.initState();
    // timeProvider = TimeProvider();
    Timer.periodic(Duration(seconds: 1), (timer) {
      TimeProvider().updateTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<TimeProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(timeProvider.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 150, 10, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                timeProvider.time,
                style: TextStyle(color: timeProvider.fontColor, fontSize: 50),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                timeProvider.country,
                style: TextStyle(color: timeProvider.fontColor, fontSize: 18),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/location');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: timeProvider.fontColor,
                    ),
                    Text(
                      'Select Location',
                      style: TextStyle(
                        color: timeProvider.fontColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
