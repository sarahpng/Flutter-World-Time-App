import 'package:flutter/material.dart';
import 'package:world_time_app/constants/country_list.dart';
import 'package:world_time_app/services/time_provider.dart';

class CountryListView extends StatefulWidget {
  const CountryListView({super.key});

  @override
  State<CountryListView> createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  late TimeProvider timeProvider;
  @override
  void initState() {
    timeProvider = TimeProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  title: Text(locations[index].city),
                  onTap: () {
                    timeProvider.fetch(
                        location: locations[index].city,
                        continent: locations[index].continent);
                    Navigator.pop(context);
                  }),
            );
          }),
    );
  }
}
