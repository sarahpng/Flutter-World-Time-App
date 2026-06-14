import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time/provider/navigation.dart';
import 'package:world_time/ui/screens/discover/discover.dart';
import 'package:world_time/ui/screens/home/home.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppNavigation>();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: provider.currentIndex,
              children: const [HomeScreen(), DiscoverScreen()],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
