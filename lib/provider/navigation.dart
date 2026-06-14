import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppNavigation extends ChangeNotifier {
  // ignore: unused_element
  static AppNavigation s(BuildContext context, [listen = false]) =>
      Provider.of<AppNavigation>(context, listen: listen);

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;

      notifyListeners();
    }
  }
}
