import 'package:flutter/material.dart';

class CountryTimeView extends StatefulWidget {
  const CountryTimeView({super.key});

  @override
  State<CountryTimeView> createState() => _CountryTimeViewState();
}

class _CountryTimeViewState extends State<CountryTimeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Timezones'),
      ),
    );
  }
}
