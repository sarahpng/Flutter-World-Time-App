import 'package:flutter/material.dart';
import 'package:world_time/configs/configs.dart';
import 'package:provider/provider.dart';

import 'package:world_time/ui/widgets/core/screen/screen.dart';

part '_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Screen(
      keyboardHandler: true,
      belowBuilders: [
        Container(
          decoration: const BoxDecoration(gradient: AppColors.gradientPrimary),
        ),
      ],
      child: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        ),
      ),
    );
  }
}
