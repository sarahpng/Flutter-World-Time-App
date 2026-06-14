import 'package:flutter/material.dart';

import 'routes.dart';
import 'package:world_time/ui/screens/home/home.dart';
import 'package:world_time/ui/screens/discover/discover.dart';
import 'package:world_time/ui/screens/splash/splash.dart';
import 'package:world_time/ui/screens/time_convertor/time_convertor.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final appRoutes = <String, WidgetBuilder>{
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.discover: (context) => const DiscoverScreen(),
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.timeConvertor: (context) => const TimeConvertorScreen(),
  // Add Route here
};
