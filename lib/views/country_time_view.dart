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
              child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(provider.image),
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
                    provider.time,
                    style: TextStyle(color: provider.fontColor, fontSize: 50),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    provider.location,
                    style: TextStyle(color: provider.fontColor, fontSize: 18),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      print('tap');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: provider.fontColor,
                        ),
                        Text(
                          'Select Location',
                          style: TextStyle(
                            color: provider.fontColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
        }),
      ),
    );
  }
}
