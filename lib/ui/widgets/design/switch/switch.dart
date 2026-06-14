import 'dart:io';

import 'package:flutter/material.dart';

class AppSwitch extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggle;

  const AppSwitch({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Switch(
        value: isDarkMode,
        onChanged: onToggle,
        padding: EdgeInsets.zero,
      );
    }
    return Switch.adaptive(
      value: isDarkMode,
      onChanged: onToggle,
      padding: EdgeInsets.zero,
    );
  }
}
