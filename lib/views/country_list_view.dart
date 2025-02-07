import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time_app/constants/country_list.dart';

import 'package:world_time_app/services/time_provider.dart';

class CountryListView extends StatefulWidget {
  const CountryListView({super.key});

  @override
  State<CountryListView> createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  // late TimeProvider timeProvider;

  // @override
  // void initState() {
  //   timeProvider = TimeProvider();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<TimeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: ListTile(
                  leading: Image(
                      width: 30,
                      height: 30,
                      image: AssetImage(locations[index].flag)),
                  title: Text(locations[index].country),
                  onTap: () {
                    timeProvider.update(
                      city: locations[index].city,
                      continent: locations[index].continent,
                      country: locations[index].country,
                    );
                    // timeProvider.fetch();
                    Navigator.pop(context);
                  }),
            );
          }),
    );
  }
}
