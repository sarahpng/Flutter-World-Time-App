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
    timeProvider = TimeProvider();

    timeProvider.fetch(location: 'Riga', url: 'Europe/Riga');

    super.initState();
  }

  @override
  void dispose() {
    timeProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => timeProvider,
        child: Consumer<TimeProvider>(builder: (context, provider, child) {
          return NotificationListener(
              child: Column(
            children: [
              Text(provider.location),
              Text(provider.time),
            ],
          ));
        }),
      ),
    );
  }
}
